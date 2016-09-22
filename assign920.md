1. dart语言特性中的循环语句定义和操作方法
2. dart字符串的定义和操作方法
3. 
***********

T2 关于字符串的定义及操作方法 官网原文如下: Strings

A Dart string is a sequence of UTF-16 code units. You can use either single or double quotes to create a string:

var s1 = 'Single quotes work well for string literals.'; var s2 = "Double quotes work just as well."; var s3 = 'It\'s easy to escape the string delimiter.'; var s4 = "It's even easier to use the other delimiter."; (用var声明一个字符串变量，单引号双引号都可以） You can put the value of an expression inside a string by using ${expression}. If the expression is an identifier, you can skip the {}. To get the string corresponding to an object, Dart calls the object’s toString() method. （ 通过$，可以在字符串中可以插入变量的值，${}可以插入表达式。单引号或双引号的字符串都可以使用。） var s = 'string interpolation';

assert('Dart has $s, which is very handy.' == 'Dart has string interpolation, ' + 'which is very handy.'); assert('That deserves all caps. ' + '${s.toUpperCase()} is very handy!' ==（将表达式里的字符串进行大写操作) 'That deserves all caps. ' + 'STRING INTERPOLATION is very handy!'); （这里有一点很重要 ，dart里不会默认“+” 为连接字符串的操作符，而默认为字符串里的一个值）

Note: The == operator tests whether two objects are equivalent. Two strings are equivalent if they contain the same sequence of code units.

You can concatenate strings using adjacent string literals or the + operator:

var s1 = 'String ' 'concatenation' " works even over line breaks."; assert(s1 == 'String concatenation works even over ' 'line breaks.'); （相邻字符串自动连接） var s2 = 'The + operator ' + 'works, as well.'; assert(s2 == 'The + operator works, as well.');

Another way to create a multi-line string: use a triple quote with either single or double quotation marks:

var s1 = ''' You can create multi-line strings like this one. ''';

var s2 = """This is also a multi-line string."""; （使用三个单引号或双引号的多行字符串） You can create a “raw” string by prefixing it with r:

var s = r"In a raw string, even \n isn't special."; （声明原始字符串，可以避免\的转义作用，在正则表达式里特别有用） See Runes for details on how to express Unicode characters in a string.

Literal strings are compile-time constants, as long as any interpolated expression is a compile-time constant that evaluates to null or a numeric, string, or boolean value.

// These work in a const string. const aConstNum = 0; const aConstBool = true; const aConstString = 'a constant string';

// These do NOT work in a const string. var aNum = 0; var aBool = true; var aString = 'a string'; const aConstList = const [1, 2, 3];

const validConstString = '$aConstNum $aConstBool $aConstString'; // const invalidConstString = '$aNum $aBool $aString $aConstList'; （不太理解。。。。。。。。）

To represent boolean values, Dart has a type named bool. Only two objects have type bool: the boolean literals true and false, which are both compile-time constants.

When Dart expects a boolean value, only the value true is treated as true. All other values are treated as false. Unlike in JavaScript, values such as 1, "aString", and someObject are all treated as false.

For example, consider the following code, which is valid both as JavaScript and as Dart code:

var name = 'Bob'; if (name) { // Prints in JavaScript, not in Dart. print('You have a name!'); } （布尔变量只有true和false,非布尔变量dart中自动认为成false） If you run this code as JavaScript, it prints “You have a name!” because name is a non-null object. However, in Dart running in production mode, the preceding code doesn’t print at all because name is converted to false (because name != true). In Dart running in checked mode, the preceding code throws an exception because the name variable is not a bool.

Here’s another example of code that behaves differently in JavaScript and Dart:

if (1) { print('JS prints this line.'); } else { print('Dart in production mode prints this line.'); // However, in checked mode, if (1) throws an // exception because 1 is not boolean. }

Note: The previous two samples work only in production mode, not checked mode. In checked mode, an exception is thrown if a non-boolean is used when a boolean value is expected.

Dart’s treatment of booleans is designed to avoid the strange behaviors that can arise when many values can be treated as true. What this means for you is that, instead of using code like if (nonbooleanValue), you should instead explicitly check for values. For example:

// Check for an empty string. var fullName = ''; assert(fullName.isEmpty);

// Check for zero. var hitPoints = 0; assert(hitPoints <= 0);

// Check for null. var unicorn; assert(unicorn == null);

// Check for NaN. var iMeantToDoThis = 0 / 0; assert(iMeantToDoThis.isNaN);

*******************

3. dart函数定义和使用方法
4. dart中数组定义和使用方法
5.dart中列表定义和使用方法

***************************

官网原文如下：

Lists

Perhaps the most common collection in nearly every programming language is the array, or ordered group of objects. In Dart, arrays are List objects, so we usually just call them lists.

Dart list literals look like JavaScript array literals. Here’s a simple Dart list:

var list = [1, 2, 3];

Lists use zero-based indexing, where 0 is the index of the first element and list.length - 1 is the index of the last element. You can get a list’s length and refer to list elements just as you would in JavaScript:

var list = [1, 2, 3];
assert(list.length == 3);
assert(list[1] == 2);

list[1] = 1;
assert(list[1] == 1);

To create a list that’s a compile-time constant, add const before the list literal:

var constantList = const [1, 2, 3];
// constantList[1] = 1; // Uncommenting this causes an error.

The List type has many handy methods for manipulating lists. For more information about lists, see Generics and Collections.
（总体和其他语言列表的定义和操作方法没有太大区别 ）

*****************************************
6.dart中 Map定义和使用方法
7. querySelector（）函数的详细API解释
8. 详细解释dart如何操作html的文档
9. dart web app 应用程序组织结构的解释部分
10. dart可用的各种工具的解释部分GYH
11. 指引你到其他社区社区寻求dart相关问题帮助的解释部分
12. 从web storm软件菜单找出webstrom 中dart开发的帮助文档

 
