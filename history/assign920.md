#dart语言特性中的循环语句定义和操作方法
*FOR语句

var message = new StringBuffer("Dart is fun");
for (var i = 0; i < 5; i++) {
  message.write('!');
}

*ForEach（）语句
如果你要迭代的对象是interable型，你可以用forEach（）语句，如果你不需要知道循环计数这是一个很好的选择：
candidates.forEach((candidate) => candidate.interview());

*For-in（）语句
var collection = [0, 1, 2];
for (var x in collection) {
  print(x);
}

*While and do-while
前测循环结构
while (!isDone()) {
  doSomething();
}
后测循环结构
do {
  printLine();
} while (!atEndOfPage());

*Break and continue
用break语句终止循环
while (true) {
  if (shutDownRequested()) break;
  processIncomingRequests();
}
Continue语句跳出循环进行下一循环
for (int i = 0; i < candidates.length; i++) {
  var candidate = candidates[i];
  if (candidate.yearsExperience < 5) {
    continue;
  }
  candidate.interview();
}

？dart循环的终止得到索引的值，避免出现Java的陷阱：
var callbacks = [];
for (var i = 0; i < 2; i++) {
  callbacks.add(() => print(i));
}
callbacks.forEach((c) => c());回调函数
这个结果在dart中得到的是0、1；在JavaScript中得到的是2、2.
*********************************************************************************************
#dart字符串的定义和操作方法
官网原文如下: Strings

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

# dart函数定义和使用方法

https://www.dartlang.org/guides/language/language-tour#functions

//定义一个函数
函数名a（参数1类型  参数1；参数2类型 参数2；...）
{    执行行代码；}

//函数调用：
{//事先说明 参数1类型 参数1；参数2类型 参数2；...
函数名a（参数1；参数2；...）;}

# dart中数组定义和使用方法
******************************************
在Dart语言中数组即列表，所以我们称为list而不是array。Dart语言的列表表面上就像Javascript的数组。
列表是基于0的索引，即0是列表的第一个元素，列表长度减一是最后一个元素。可以实现Javascript的得到列表长度，参考列表元素。

*声明表：
var constantList = const [1, 2, 3];常量列表
// constantList[1] = 1; // Uncommenting this causes an error.

var names = new List<String>();字符串列表
names.addAll(['Seth', 'Kathy', 'Lars']);
// ...
names.add(42); // Fails in checked mode (succeeds in production mode).

*可以用常量去创建或初始化数组，或者用构造函数来构造列表。列表还有几种方式来添加或删除项。
// Use a List constructor.（表构造器）
var vegetables = new List();

// Or simply use a list literal.（列表手动输入）
var fruits = ['apples', 'oranges'];

// Add to a list.（添加一项）
fruits.add('kiwis');

// Add multiple items to a list.（添加多项）
fruits.addAll(['grapes', 'bananas']);

// Get the list length.（声明表长）
assert(fruits.length == 5);

// Remove a single item.（删除项）
var appleIndex = fruits.indexOf('apples');
fruits.removeAt(appleIndex);
assert(fruits.length == 4);

// Remove all elements from a list.
fruits.clear();（清除项）
assert(fruits.length == 0);

* indexOf()语句查找列表元素
var fruits = ['apples', 'oranges'];
// Access a list item by index.

assert(fruits[0] == 'apples');（通过索引获取项）
// Find an item in a list.

assert(fruits.indexOf('apples') == 0);（在列表中找到项）

*sort（）语句对列表分类，你也可以用排序功能来比较元素用<0\=0\>0
下面的例子用compareTo（）语句
var fruits = ['bananas', 'apples', 'oranges'];
// Sort a list.

fruits.sort((a, b) => a.compareTo(b));

assert(fruits[0] == 'apples');

*定长列表&变长列表fixed&growable

直接设置长度可能需要时间成正比的新的长度，并可能改变内部的能力，使一个后续的操作将需要立即增加缓冲容量。（只支持API的子集）
List<int> fixedLengthList = new List(5);

fixedLengthList.length = 0;  // Error

fixedLengthList.add(499);    // Error

fixedLengthList[0] = 87;

List<int> growableList = [1, 2];

growableList.length = 0;

growableList.add(499);

growableList[0] = 87;
在循环过程中改变定长表长会发生ConcurrentModificationError错误，而变长不会发生；此外，如果是暂时性的改变并且在迭代之前恢复，则不会被系统发现。
*************************************************************************************************************************
#dart中列表定义和使用方法

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
#dart中 Map定义和使用方法

https://www.dartlang.org/guides/language/language-tour#built-in-types

地图是包含指针和值的一个对象。指针和值可以是任意类型的对象。在一个程序中，每个指针定义名不可重复，但指针所指向的值可以相同。
//map定义方法1：
var 地图名a={
指针1：值1，
指针2：值2,
指针3: 值3
...........}
//map定义方法2：
var 地图名b=new Map();
地图名b[指针1]=值1;
地图名b[指针2]=值2;
地图名b[指针3]=值3;
 .......}
//添加
var 地图名a={指针1：值1}；
地图名[要添加的指针名4]=值；
*******************************************
#querySelector（）函数的详细API解释
根据 CSS 选择器规范，便捷定位文档中指定元素
querySelector 和 querySelectorAll 在规范中定义了如下接口：
module dom { [Supplemental, NoInterfaceObject] interface NodeSelector { Element querySelector(in DOMString selectors); NodeList querySelectorAll(in DOMString selectors); }; Document implements NodeSelector; DocumentFragment implements NodeSelector; Element implements NodeSelector; };

*返回指定元素节点的子树中匹配选择器的集合中的第一个元素，如果没有匹配返回null
querySelector返回的是一个第一个匹配元素，querySelectorAll返回的一个所有匹配元素集合(NodeList)
querySelector('#button') // Get an object.
  ..text = 'Confirm'   // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'));
button.onClick.listen((e) => window.alert('Confirmed!'));

获取文档中 id="demo" 的第一个元素：
document.querySelector("#demo");

从接口定义可以看到Document、DocumentFragment、Element都实现了NodeSelector接口。即这三种类型的元素都拥有者两个方法。querySelector和querySelectorAll的参数须是符合 css selector 的字符串。不同的是querySelector返回的是一个对象，querySelectorAll返回的一个集合(NodeList)。
****************************************************************************************************

#详细解释dart如何操作html的文档

#dart web app 应用程序组织结构的解释部分
https://webdev.dartlang.org/codelabs/ng2/1-skeleton#--what-did-you-get
***********************************************************************
#dart可用的各种工具的解释部分
tools for Dart apps

*DartPad
DartPad是一个很好学习Dart语法，实验dart语言特征和核心库的方式
体验Dart语言，无需在电脑上安装Dart开发环境，可以使用Google提供的Dart云编译服务——DartPad。DartPad是一个自由、开放的源码服务，帮助开发人员学习Dart语言，进入DartPad的源代码会被发送到谷歌云计算平台上运行，服务器会将源代码进行编译并处理成JavaScript返回给浏览器，编译产生的错误和警告也会返回
*IDES
许多常用的IDE插件存在插件。如果你还没有一个喜欢的IDE，试试WebStorm，是dart语言支持下的。IDES 的全称是 Internet Demonstration and Evaluation System (互联网演示和评估系统)。IDES 是 SAP R/3 系统的一个演示版本，IDES 系统模拟了一个范例公司，该公司是一个在一些国家拥有分公司的国际集团。IDES 系统还包含了各种业务场景所需的应用数据。IDES 通过简单易懂的业务场景来演示 SAP R/3 系统的功能，这些业务流程都是为了反应现实生活中的业务需求而设置的。不过 IDES 的重点并不在于强调功能本身，而是在于业务流程以及业务流程之间的整合。
*SDKs
软件开发工具包
 
*Command-line tools命令行工具
Pub package manager 包管理器
管理dart包，便于用户安装、使用和分享库，命令行工具和其他。有些dart的技术如flutter可能不支持所有的pub命令。支持DART的软件开发包大体上支持pub，但是你也可以用命令行。(pub)
Static analyzer静态分析
评估报告代码中的错误或警告，dart的IDE插件运用dart的分析引擎，也可以通过命令行运行分析器(dartanalyzer)
Static Analyzer是一个非常好的工具, 它可以帮助我们发现编译器警告不会提示的问题。
Static Analysis 优点：
1、使用操作容易。
2、能够在编码阶段，开发自行进行代码检查。早期发现代码隐患。
3、直接分析源代码来发现程序中的错误，而不需要实际运行。
4、自动检测objective-C程序中的BUG，发现内存泄露和其它问题。
5、内存问题发现越早，解决的代价就越小。

Code formatter程序代码格式制作器
支持dart的IDEs允许格式化代码，或者可以通过命令行来运行。 (dartfmt)

Tools for the Web
*Dartium
用Dartium意味着在你准备在浏览器上测试前不用去Javascript上编译。
不要用Dartium作为你的首要浏览器，也不要把Dartium散步给用户。
*Webstorm
*Command-line tools
对于网站开发的命令行工具有：dart2js；dart2js；pub serve
*************************************************************************************
#指引你到其他社区社区寻求dart相关问题帮助的解释部分
***************************************************
找到的一些关于dart搜索到的资源链接
官方网站：http://www.dartlang.org/

最新动态：http://news.dartlang.org
Twitter：https://twitter.com/dart_lang
新浪微博：@Dart语言
Google+：https://plus.google.com/+dartlang/posts 
Dartisans 社群: https://plus.google.com/communities/114566943291919232850
讨论组（Google Groups）：https://groups.google.com/a/dartlang.org/forum/#!forum/misc
Stackoverflow 问答支持： http://stackoverflow.com/questions/tagged/dart


在线试用：http://try.dartlang.org/
API 文档：http://api.dartlang.org/
FAQ：http://www.dartlang.org/support/faq.html
所有文章：http://www.dartlang.org/articles/index.html
语言向导：http://www.dartlang.org/docs/language-tour/
类库向导：http://www.dartlang.org/docs/library-tour/
Web开发向导：http://www.dartlang.org/docs/tutorials/
代码风格指南：http://www.dartlang.org/articles/style-guide/

讲义ppt：http://www.dartlang.org/slides/  (或微盘下载 http://vdisk.weibo.com/u/3198820011 )
语言规范：http://www.dartlang.org/docs/spec/index.html
包管理工具Pub： http://pub.dartlang.org/
Bugs 和 Feature 列表：http://dartbug.com/ 

Dart 与 JavaScript、C#、Python 对比：http://synonym.dartlang.org/
Dart VM、 V8 和 dart2js 性能对比：http://www.dartlang.org/performance/
Github 上各种 Dart 项目：https://github.com/dart-lang

视频集合：
Dart Screencasts
Dart Tips
Youtube 上搜索 DartlangTV

工具：
SDK：http://www.dartlang.org/docs/sdk/ ，SDK 包含 Dart VM、dart2js、Pub、库和工具。
Dartium：http://www.dartlang.org/dartium/ ，内嵌 Dart VM 的 Chromium ，可以在浏览器中直接执行 dart 代码。
Dart Editor：http://www.dartlang.org/docs/editor/ ，基于 Eclipse 的全功能 IDE，包含以上所有。
国内镜像下载地址：http://dart.hanguokai.com/


非官方资源：
Seth Ladd 的博客 http://blog.sethladd.com/ ，Dart 官方成员中最活跃的宣传员，他的博客上写有大量关于 Dart 的文章。
Chris Strom 的博客 http://japhr.blogspot.com/ ，《Dart for Hipsters》的作者，有许多 Dart 的文章。
Dartwatch http://blog.dartwatch.com/ ，《Dart in Action》的作者创建的关于 Dart 的网站。
15分钟看代码学 Dart：Learn Dart in Y Minutes http://learnxinyminutes.com/docs/dart/
***********************************************************************************
#从web storm软件菜单找出webstrom 中dart开发的帮助文档

https://confluence.jetbrains.com/display/WI/Getting+started+with+Dart
 ************************************************************************
