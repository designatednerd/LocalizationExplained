//: Playground - noun: a place where people can play

//: Some fun stuff with various formatters and localization/internationalization.

import UIKit

/*******************
 * NSDateFormatter *
 *******************/

let dateFormatter = NSDateFormatter()
dateFormatter.dateStyle = .ShortStyle
dateFormatter.timeStyle = .ShortStyle

let now = NSDate()
print(dateFormatter.stringFromDate(now))

//What if I was British?
dateFormatter.locale = NSLocale(localeIdentifier: "en-GB")
print(dateFormatter.stringFromDate(now))

//What would this look like to a german-speaker?
dateFormatter.locale = NSLocale(localeIdentifier: "de")
print(dateFormatter.stringFromDate(now))

//What about a Chinese speaker?
dateFormatter.locale = NSLocale(localeIdentifier: "zh")
print(dateFormatter.stringFromDate(now))


//What if you need something with a more specific format?
let specificDateFormatter = NSDateFormatter()

//Comment this line out or change the locale identifier to see different formats
specificDateFormatter.locale = NSLocale(localeIdentifier: "fr")

let localeFormatString = NSDateFormatter.dateFormatFromTemplate("MMM dd YYYY", options: 0, locale: specificDateFormatter.locale)
specificDateFormatter.dateFormat = localeFormatString

//If this was just using , it'd be août 17, 2015, but instead it's 17 août 2015
print(specificDateFormatter.stringFromDate(now))


/**************
 * NSTimeZone *
 **************/

//These are often all the same, but check the docs for which you should be using:

//Uses the current time zone for this app, does not automatically update
let defaultTimeZone = NSTimeZone.defaultTimeZone()
print(defaultTimeZone)

//Uses the current time zone for the system, does not automatically update.
let systemTimeZone = NSTimeZone.systemTimeZone()
print(systemTimeZone)

//Uses the current time zone for this app, DOES automatically update.
let localTimeZone = NSTimeZone.localTimeZone()
print(localTimeZone)

//How does time zone affect a date formatter?
let chicagoFormatter = NSDateFormatter()
chicagoFormatter.timeStyle = .ShortStyle

//You can set a specific time zone
chicagoFormatter.timeZone = NSTimeZone(name: "CST")
print(chicagoFormatter.stringFromDate(now))

//Just watch out for daylight savings
chicagoFormatter.timeZone = NSTimeZone(name: "CDT")
print(chicagoFormatter.stringFromDate(now))

//Get all time zone names:
print(NSTimeZone.knownTimeZoneNames())

//Use the time zone that grabs the appropriate DST/Non-DST
chicagoFormatter.timeZone = NSTimeZone(name: "America/Chicago")
print(chicagoFormatter.stringFromDate(now))

/********************
 * NSDateComponents *
 ********************/

//You have to use NSCalendar to grab components
let currentCalendar = NSCalendar.currentCalendar()

let shortDateFormatter = NSDateFormatter()
shortDateFormatter.dateStyle = .ShortStyle
shortDateFormatter.timeStyle = .ShortStyle

print(shortDateFormatter.stringFromDate(now))

func getDayMonthYearComponentsForDateWithCalendar(calendar: NSCalendar, date: NSDate) -> NSDateComponents {
    //Union all the components you wish to grab together
    let unit = NSCalendarUnit.Year.union(NSCalendarUnit.Month.union(NSCalendarUnit.Day))
    let components = calendar.components(unit, fromDate: now)
    return components
}

let components = getDayMonthYearComponentsForDateWithCalendar(currentCalendar, date: now)

print(components.day)
print(components.year)
print(components.month)

components.day += 1

if let tomorrow = currentCalendar.dateFromComponents(components) {
    //Note that date from components ignores any unset components, so the time will be 12:00am
    print(shortDateFormatter.stringFromDate(tomorrow))
} else {
    print("tomorrow optional returned nil!")
}

/**************
 * NSCalendar *
 **************/

//What about non-gregorian calendars? 

if let buddhistCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierBuddhist) {
    //You can use the calendar for the date formatter:
    let buddhistFormatter = NSDateFormatter()
    buddhistFormatter.dateStyle = .ShortStyle
    buddhistFormatter.calendar = buddhistCalendar
    
    //This now uses the Buddhist calendar, which uses the same month/day but a wildly different year.
    print(buddhistFormatter.stringFromDate(now))
    
    let buddhistComponents = getDayMonthYearComponentsForDateWithCalendar(buddhistCalendar, date: now)
    
    print(buddhistComponents.day)
    print(buddhistComponents.year)
    print(buddhistComponents.month)
    
    buddhistComponents.day += 1
    
    if let buddhistTomorrow = buddhistCalendar.dateFromComponents(buddhistComponents) {
        //Note that date from components ignores any unset components, so the time will be 12:00am
        print(buddhistFormatter.stringFromDate(buddhistTomorrow))
    } else {
        print("buddhist tomorow optional returned nil!")
    }
} else {
    print("No buddha for you!")
}

/**************************
 * NSPersonNameComponents *
 **************************/

//My uncle Jimmy, the pediatric cardiologist
let nameComponents = NSPersonNameComponents()
nameComponents.familyName = "Shapiro"
nameComponents.middleName = "James"
nameComponents.givenName = "Alan"
nameComponents.nickname = "Jimmy"
nameComponents.namePrefix = "Dr."

let nameFormatter = NSPersonNameComponentsFormatter()
print(nameFormatter.stringFromPersonNameComponents(nameComponents))

nameFormatter.style = .Long
print(nameFormatter.stringFromPersonNameComponents(nameComponents))

nameFormatter.style = .Medium
print(nameFormatter.stringFromPersonNameComponents(nameComponents))

nameFormatter.style = .Short
print(nameFormatter.stringFromPersonNameComponents(nameComponents))

nameFormatter.style = .Abbreviated
print(nameFormatter.stringFromPersonNameComponents(nameComponents))

/*********************
 * NSLengthFormatter *
 *********************/

let lengthFormater = NSLengthFormatter()

//This formats a string based on a value
print(lengthFormater.stringFromValue(64, unit: .Inch))

//If your preferred locale in the US, this will display 1.094yd
//Otherwise, it'll display 1m
print(lengthFormater.stringFromMeters(1))

//If you're using this for height, it'll display feet and inches instead of yards.
lengthFormater.forPersonHeightUse = true
print(lengthFormater.stringFromMeters(1))

/*******************
 * NSMassFormatter *
 *******************/

let massFormatter = NSMassFormatter()

//Use the specified units
print(massFormatter.stringFromValue(16, unit: .Stone))
print(massFormatter.stringFromValue(50, unit: .Kilogram))

//Use the locale-preferred unit of measurement
print(massFormatter.stringFromKilograms(50))

//For en-US, this doesn't actually change anything - it stays in pounds.
massFormatter.forPersonMassUse = true
massFormatter.stringFromKilograms(50)
