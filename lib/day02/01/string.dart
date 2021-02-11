main() {
  String name = 'Kevin'; // 字符串支持单引号
  String proverbs = "'踏破芒鞋，烟雨任平生'"; // 双引号
  String poem = """ // 三引号
  《零境》
    ----张风捷特烈
飘缥兮飞烟浮定，
渺缈兮皓月风清。
纷纷兮初心复始，
繁繁兮万绪归零。
     2017.11.7 改  <br/>
  """;
  print('${name}\n$proverbs\n$poem'); // 支持字符串内嵌表达式

  String url = "https://github.com/kevinje ";
  print(url.split("://")); // https 字符串切割
  print(url.substring(4, 9)); // s:g 字符串截取  [起始索引,结束索引) 左闭右开
  print(url.codeUnitAt(4)); // 索引处字符的UTF-16码
  print(url.startsWith("https")); // true 是否以指定字符开头
  print(url.endsWith(" ")); // true 是否以指定字符结尾
  print(url.indexOf("github")); // 8 指定字符的索引
  print(url.contains("github")); // true 是否包含指定字符
  print(url.length); // 27 字符串长度
  print(url.replaceFirst("m", "M")); // 替换第一个遇见的字符为指定字符
  print(url.replaceAll("t", "T")); // 替换所有字符为指定
}