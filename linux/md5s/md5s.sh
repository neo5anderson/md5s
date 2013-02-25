#!/bin/bash
#
# 针对本程序斑驳不担保任何责任，欲知详细请查看 GPL.txt
# 这是一个自由的程序，欢迎您在特定条件下再次发布本程序。
#
# 再次感谢您使用本脚本
# 斑驳敬上
#

read -p '请输入 HTML 标题，默认 [为什么选择 PHP]：' HTML_TITLE
if [ "" == "$HTML_TITLE" ]; then
	HTML_TITLE='为什么选择 PHP'
fi

read -p '请输入 footer 标题，默认 [为什么选择 PHP]：' FOOTER_TITLE
if [ "" == "$FOOTER_TITLE" ]; then
	FOOTER_TITLE='为什么选择 PHP'
fi

FOOTER_INFO=`date +%D`' @ '`whoami`

read -p '请输入 生成文件名称，默认 [why-not-php]：' OUTPUT
if [ "" == "$OUTPUT" ]; then
	OUTPUT='why-not-php'
fi

read -p '是否要发布，默认 [No]：' IS_RELEASE
if [ "" == "$IS_RELEASE" ]; then
	# S5_PATH='md5s/s5'
	S5_PATH='default'
else
	echo $IS_RELEASE | grep -i 'Y' > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		S5_PATH='http://222.134.70.138:30086/neo/utils/s5'
	else
		# S5_PATH='md5s/s5'
		S5_PATH='default'
	fi
fi

MD_FILE=todo.markdown
MARKDOWN_CALL=markdown

OUTPUT_FOLDER=$(echo `pwd` | sed "s/\/md5s$//")

if [ ! -e $MD_FILE ]; then
	echo "MD_FILE ($MD_FILE) not found"
	exit 404
fi

which $MARKDOWN_CALL > /dev/null 2>&1
if [ $? -gt 0 ]; then
	echo "MARKDOWN_CALL ($MARKDOWN_CALL) not found"
	exit 404
fi

# header
echo -n '正在生成 header . . '
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'> /tmp/$OUTPUT.header
echo "<!-- All contents under GPL license. loving Delly, NEO's Edition is Okay~ -->">> /tmp/$OUTPUT.header
echo '<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" xml:lang="zh-CN">'>> /tmp/$OUTPUT.header
echo '<head>'>> /tmp/$OUTPUT.header
echo '	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">'>> /tmp/$OUTPUT.header
echo "	<title>$HTML_TITLE</title>">> /tmp/$OUTPUT.header
echo "	<meta name=\"generator\" content=\"`basename $0 .sh` v0.1\">">> /tmp/$OUTPUT.header
echo '	<meta name="version" content="S5 1.1">'>> /tmp/$OUTPUT.header
echo '	<meta name="author" content="Neo">'>> /tmp/$OUTPUT.header
echo "	<meta name=\"company\" content=\"NEO's Edition is Okay~\">">> /tmp/$OUTPUT.header
echo ''>> /tmp/$OUTPUT.header
echo '	<meta name="defaultView" content="slideshow" />'>> /tmp/$OUTPUT.header
echo '	<meta name="controlVis" content="hidden" />'>> /tmp/$OUTPUT.header
echo "	<link rel=\"stylesheet\" href=\"$S5_PATH/slides.css\" type=\"text/css\" media=\"projection\" id=\"slideProj\" />">> /tmp/$OUTPUT.header
echo "	<link rel=\"stylesheet\" href=\"$S5_PATH/outline.css\" type=\"text/css\" media=\"screen\" id=\"outlineStyle\" />">> /tmp/$OUTPUT.header
echo "	<link rel=\"stylesheet\" href=\"$S5_PATH/print.css\" type=\"text/css\" media=\"print\" id=\"slidePrint\" />">> /tmp/$OUTPUT.header
echo "	<link rel=\"stylesheet\" href=\"$S5_PATH/opera.css\" type=\"text/css\" media=\"projection\" id=\"operaFix\" />">> /tmp/$OUTPUT.header
echo ''>> /tmp/$OUTPUT.header
echo "	<script src=\"$S5_PATH/slides.js\" type=\"text/javascript\"></script>">> /tmp/$OUTPUT.header
echo '</head>'>> /tmp/$OUTPUT.header
echo '<body>'>> /tmp/$OUTPUT.header
echo '	<div class="layout">'>> /tmp/$OUTPUT.header
echo '		<div id="controls"></div>'>> /tmp/$OUTPUT.header
echo '		<div id="currentSlide"></div>'>> /tmp/$OUTPUT.header
echo '		<div id="header"></div>'>> /tmp/$OUTPUT.header
echo '		<div id="footer">'>> /tmp/$OUTPUT.header
echo "			<h1>$FOOTER_TITLE</h1>">> /tmp/$OUTPUT.header
echo "			<h2>$FOOTER_INFO</h2>">> /tmp/$OUTPUT.header
echo '		</div>'>> /tmp/$OUTPUT.header
echo '	</div>'>> /tmp/$OUTPUT.header
echo ''>> /tmp/$OUTPUT.header
echo '	<div class="presentation">'>> /tmp/$OUTPUT.header
echo ''>> /tmp/$OUTPUT.header
echo '.'

# slider
echo -n '正在生成 slide . '
$MARKDOWN_CALL $MD_FILE > /tmp/$OUTPUT.markdown.html
echo -n '. '
COUNT=0
echo -n ''> /tmp/$OUTPUT.slide
while read line; do
	echo $line | grep '<h1>' > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		if [ $COUNT -gt 0 ]; then
			echo '		</div>'>> /tmp/$OUTPUT.slide
			echo ''>> /tmp/$OUTPUT.slide
		fi
		echo '		<div class="slide">'>> /tmp/$OUTPUT.slide
	fi
	COUNT=$(($COUNT+1))
	if [ "" != "$line" ]; then
		echo "			$line">> /tmp/$OUTPUT.slide
	fi
done < /tmp/$OUTPUT.markdown.html
if [ $COUNT -gt 0 ]; then
	echo '		</div>'>> /tmp/$OUTPUT.slide
fi
echo '.'

# footer
echo -n '正在生成 footer . . '
echo '	</div>'> /tmp/$OUTPUT.footer
echo ''>> /tmp/$OUTPUT.footer
echo '</body>'>> /tmp/$OUTPUT.footer
echo '</html>'>> /tmp/$OUTPUT.footer
echo ''>> /tmp/$OUTPUT.footer
echo '.'

cat /tmp/$OUTPUT.header /tmp/$OUTPUT.slide /tmp/$OUTPUT.footer > $OUTPUT_FOLDER/$OUTPUT.html
echo 完成

