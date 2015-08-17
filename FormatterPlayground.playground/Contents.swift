//: Playground - noun: a place where people can play

import UIKit

/*******************
 * NSDateFormatter *
 *******************/

let formatter = NSDateFormatter()
formatter.dateStyle = .ShortStyle
formatter.timeStyle = .ShortStyle

let now = NSDate()
print(formatter.stringFromDate(now))

//What if I was British?
formatter.locale = NSLocale(localeIdentifier: "en-GB")
print(formatter.stringFromDate(now))

//What would this look like to a german-speaker?
formatter.locale = NSLocale(localeIdentifier: "de")
print(formatter.stringFromDate(now))

//What about a Chinese speaker?
formatter.locale = NSLocale(localeIdentifier: "zh")
print(formatter.stringFromDate(now))

/**************
 * NSTimeZone *
 **************/

let defaultTimeZone = NSTimeZone.defaultTimeZone()
print(defaultTimeZone)

let systemTimeZone = NSTimeZone.systemTimeZone()
print(systemTimeZone)

let localTimeZone = NSTimeZone.localTimeZone()
print(localTimeZone)

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
