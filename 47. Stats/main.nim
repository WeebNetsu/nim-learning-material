import std/stats

# stats allows us to perform basic statistical analysis of data
var class1Marks: RunningStat # must be a var so we can modify it with push

# add data to stat
class1Marks.push(@[70.0, 30.0, 95.0, 52.0, 63.0, 70.0, 46.0])

# get general data of stats
echo class1Marks
echo $class1Marks # converts to a string

echo class1Marks.n # number of data in stats

class1Marks.push(@[10.0, 90.0])

echo class1Marks.n

echo class1Marks.mean() # computes the mean
# Computes the current population variance
echo class1Marks.variance()
# Computes the current sample variance
echo class1Marks.varianceS()
# Computes the current population skewness
echo class1Marks.skewness()
# Computes the current sample skewness
echo class1Marks.skewnessS()
# Computes the population kurtosis
echo class1Marks.kurtosis()
# Computes the current sample kurtosis
echo class1Marks.kurtosisS()

var class2Marks: RunningStat
class2Marks.push(@[40.0, 80.0, 25.0, 72.0, 100.0, 70.0, 41.0])

# add stats to class1Marks
class1Marks += class2Marks

echo class1Marks

# clears the data from the stat
clear(class1Marks)
echo class1Marks
