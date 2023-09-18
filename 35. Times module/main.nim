import std/times

#[
    d	Numeric value representing the day of the month, it will be either one or two digits long.
    1/04/2012 -> 1
    21/04/2012 -> 21

    dd	Same as above, but is always two digits.
    1/04/2012 -> 01
    21/04/2012 -> 21

    ddd	Three letter string which indicates the day of the week.
    Saturday -> Sat
    Monday -> Mon

    dddd	Full string for the day of the week.
    Saturday -> Saturday
    Monday -> Monday

    h	The hours in one digit if possible. Ranging from 1-12.
    5pm -> 5
    2am -> 2

    hh	The hours in two digits always. If the hour is one digit, 0 is prepended.
    5pm -> 05
    11am -> 11

    H	The hours in one digit if possible, ranging from 0-23.
    5pm -> 17
    2am -> 2

    HH	The hours in two digits always. 0 is prepended if the hour is one digit.
    5pm -> 17
    2am -> 02

    m	The minutes in one digit if possible.
    5:30 -> 30
    2:01 -> 1

    mm	Same as above but always two digits, 0 is prepended if the minute is one digit.
    5:30 -> 30
    2:01 -> 01

    M	The month in one digit if possible.
    September -> 9
    December -> 12

    MM	The month in two digits always. 0 is prepended if the month value is one digit.
    September -> 09
    December -> 12

    MMM	Abbreviated three-letter form of the month.
    September -> Sep
    December -> Dec

    MMMM	Full month string, properly capitalized.
    September -> September

    s	Seconds as one digit if possible.
    00:00:06 -> 6

    ss	Same as above but always two digits. 0 is prepended if the second is one digit.
    00:00:06 -> 06

    t	A when time is in the AM. P when time is in the PM.
    5pm -> P
    2am -> A

    tt	Same as above, but AM and PM instead of A and P respectively.
    5pm -> PM
    2am -> AM

    yy	The last two digits of the year. When parsing, the current century is assumed.
    2012 AD -> 12

    yyyy	The year, padded to at least four digits. Is always positive, even when the year is BC. When the year is more than four digits, '+' is prepended.
    2012 AD -> 2012
    24 AD -> 0024
    24 BC -> 00024
    12345 AD -> +12345

    YYYY	The year without any padding. Is always positive, even when the year is BC.
    2012 AD -> 2012
    24 AD -> 24
    24 BC -> 24
    12345 AD -> 12345

    uuuu	The year, padded to at least four digits. Will be negative when the year is BC. When the year is more than four digits, '+' is prepended unless the year is BC.
    2012 AD -> 2012
    24 AD -> 0024
    24 BC -> -0023
    12345 AD -> +12345

    UUUU	The year without any padding. Will be negative when the year is BC.
    2012 AD -> 2012
    24 AD -> 24
    24 BC -> -23
    12345 AD -> 12345

    z	Displays the timezone offset from UTC.
    UTC+7 -> +7
    UTC-5 -> -5

    zz	Same as above but with leading 0.
    UTC+7 -> +07
    UTC-5 -> -05

    zzz	Same as above but with :mm where mm represents minutes.
    UTC+7 -> +07:00
    UTC-5 -> -05:00

    ZZZ	Same as above but with mm where mm represents minutes.
    UTC+7 -> +0700
    UTC-5 -> -0500

    zzzz	Same as above but with :ss where ss represents seconds.
    UTC+7 -> +07:00:00
    UTC-5 -> -05:00:00

    ZZZZ	Same as above but with ss where ss represents seconds.
    UTC+7 -> +070000
    UTC-5 -> -050000

    g	Era: AD or BC
    300 AD -> AD
    300 BC -> BC

    fff	Milliseconds display
    1000000 nanoseconds -> 1 seconds

    ffffff	Microseconds display
    1000000 nanoseconds -> 1000 seconds

    fffffffff	Nanoseconds display
    1000000 nanoseconds -> 1000000 seconds
]#

#[
    DateTime:
        nanosecond: NanosecondRange
        second: SecondRange
        minute: MinuteRange
        hour: HourRange
        monthdayZero: int
        monthZero: int
        year: int
        weekday: WeekDay
        yearday: YeardayRange
        isDst: bool
        timezone: Timezone
        utcOffset: int

    TimeInterval:
        nanoseconds: int
        microseconds: int
        milliseconds: int
        seconds: int
        minutes: int
        hours: int
        days: int
        weeks: int
        months: int
        years: int

    Duration:
        seconds: int64
        nanosecond: NanosecondRange

    NanosecondRange = 0 to 999999999
    SecondRange = 0 to 60
    MinuteRange = 0 to 59
    HourRange = 0 to 23
    MonthdayRange = 1 to 31
    YeardayRange = 0 to 365

    Month:
        mJan = (1, "January"),
        mFeb = "February",
        mMar = "March",
        mApr = "April",
        mMay = "May",
        mJun = "June",
        mJul = "July",
        mAug = "August",
        mSep = "September",
        mOct = "October",
        mNov = "November",
        mDec = "December"

    WeekDay:
        dMon = "Monday"
        dTue = "Tuesday"
        dWed = "Wednesday"
        dThu = "Thursday",
        dFri = "Friday"
        dSat = "Saturday"
        dSun = "Sunday"

    TimeUnit:
        Nanoseconds, Microseconds, Milliseconds, Seconds, Minutes, Hours, Days, Weeks,
        Months, Years
]#

let e = cpuTime() # get's current CPU time, great way to time code

# parse(date, format)
let a = parse("2002-08-05", "yyyy-MM-dd") # create a date object
echo $a # $ -> convert date object to string

# between returns the time passed between 2 dates
echo between(parse("2002-08-05", "yyyy-MM-dd"), parse("2021-11-23", "yyyy-MM-dd"))

# dateTime(yyyy, MM, dd, hh, mm, ss)
# I think below is only for newer versions of nim (newer than 1.4.8)
# let d = dateTime(2005, mAug, 5, 23, 42, 21)
# echo $d

# create duration
var b = initDuration(weeks = 3, days = 2, hours = 4)
echo $b # $ -> convert duration to string
echo b * 4 # will times to the current time
b *= 2 # (6 weeks, 4 days, 8 hours)
echo b
echo a + b # takes a DateTime object and adds duration to it

let d = initDuration(weeks = 5, days = 1, seconds = 44)
echo d >= b # will check if date, duration or time interval is larger or equal to one of the same TYPE
# you can do all comparing with ==, >, >=, < ...

# get time passed in days
echo inDays(d)
# you also have inHours, inMicroseconds, inMilliseconds, inMinutes etc...

echo toParts(d) # converts it into an array
echo toParts(d)[Weeks]

echo initDuration(minutes = 5) div 3 # returns 5 min divided by 3

# create time interval
# Note that TimeInterval doesn't represent a fixed duration of time, since the duration of some units depend on the context (e.g a year can be either 365 or 366 days long). The non-fixed time units are years, months, days and week.
# Note that TimeInterval's returned from the times module are never normalized. If you want to normalize a time unit, Duration should be used instead.
let c = initTimeInterval(years = 3, nanoseconds = 400, minutes = 23)
echo $c # $ -> convert to str
# you can add, subtract and times -> intervals, durations and datetimes

echo convert(Days, Weeks, 99) # converts from one interval to another (will return 14 weeks)

# getTime returns the current date and time
let f = getTime()
echo f
# days converts number into date days
echo days(5)
echo f + days(2)

echo now() # gets current date and time

# get current time and convert it to HH:mm:ss
echo getClockStr()
echo getClockStr(now() - hours(3))

# get current date and return in in YYY-MM-DD format
echo getDateStr()

# gets day of week from a specific date
echo getDayOfWeek(7, mAug, 2002)

# get day number in year (starts at 0)
echo getDayOfYear(5, mAug, 2002)

# get number of days in that month
echo getDaysInMonth(mFeb, 2000)
echo getDaysInMonth(mFeb, 2001)

# get number of days in the year
echo getDaysInYear(2000)
echo getDaysInYear(2001)

echo utc() # get UTC timezones
echo utc(now())

# parseTime gives us a time format
let g = parseTime("2000-01-01T00:00:00+00:00", "yyyy-MM-dd'T'HH:mm:sszzz", utc())
echo g
echo toUnix(g) # this converts it to unix time
# above will return the seconds passed since 1970 until 2000
echo fromUnix(toUnix(g)) # this converts unix to time format

echo isLeapYear(2000) # true if leap year

echo "Time it took to finish entire program: ", cpuTime() - e
