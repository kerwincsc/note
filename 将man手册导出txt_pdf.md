<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. man手册导出成txt,pdf,html的三种方法</a>
<ul>
<li><a href="#sec-1-1">1.1. 导出为txt</a></li>
<li><a href="#sec-1-2">1.2. 导出为pdf</a></li>
<li><a href="#sec-1-3">1.3. 导出为html</a></li>
</ul>
</li>
</ul>
</div>
</div>

# man手册导出成txt,pdf,html的三种方法<a id="sec-1" name="sec-1"></a>

## 导出为txt<a id="sec-1-1" name="sec-1-1"></a>

`man -t bash | col -b > bash_man.txt`

## 导出为pdf<a id="sec-1-2" name="sec-1-2"></a>

`man -t bash | ps2pdf - bash_man.pdf`

这里如何没有 `ps2pdf` 命令, 则 `yum install ghostscript -y`

## 导出为html<a id="sec-1-3" name="sec-1-3"></a>

`man -t --html=/usr/bin/firefox bash`

`cp /tmp/hmanLSa2jh/bash.html /home/talen/Documents`

这个默认是使用elinks在终端下打开man页面,也可以自己指定浏览器

经过尝试, 我本人只成功了前两种方法, [原文地址](http://www.360doc.com/content/14/0923/10/1123425_411686821.shtml)