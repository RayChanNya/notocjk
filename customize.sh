[ -x "$(which magisk)" ] && MIRRORPATH=$(magisk --path)/.magisk/mirror || unset MIRRORPATH
FILES="fonts.xml fonts_base.xml"
FILECUSTOM=fonts_customization.xml
FILEPATH=/system/etc/
FILECUSTOMPATH=/product/etc/
CUSTOMTOMOD=/system/product/etc/
for FILE in $FILES
do
if [ $API -ge "26" ] && [ -f $MIRRORPATH$FILEPATH$FILE ]; then
ui_print "- Migrating $FILE"
mkdir -p $MODPATH$FILEPATH
cp -af $MIRRORPATH$FILEPATH$FILE $MODPATH$FILEPATH$FILE
sed -i 's/<alias name="serif-bold" to="serif" weight="700" \/>/<alias name="serif-thin" to="serif" weight="100" \/>\n<alias name="serif-light" to="serif" weight="300" \/>\n<alias name="serif-medium" to="serif" weight="400" \/>\n<alias name="serif-semi-bold" to="serif" weight="500" \/>\n<alias name="serif-bold" to="serif" weight="700" \/>\n<alias name="serif-black" to="serif" weight="900" \/>/g
' $MODPATH$FILEPATH$FILE
sed -i '
/<family lang=\"zh-Hans\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Hans\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hans">\n<font weight="100" style="normal" index="2" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="100" \/><\/font>\n<font weight="300" style="normal" index="2" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="2" postScriptName="NotoSansCJKjp-Regular">NotoSansCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="2" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="2" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="2" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="2" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<font weight="200" style="normal" index="2" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="200" \/><\/font>\n<font weight="300" style="normal" index="2" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="2" fallbackFor="serif" postScriptName="NotoSerifCJKjp-Regular">NotoSerifCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="2" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="2" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="2" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="2" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<\/family>/};
' $MODPATH$FILEPATH$FILE
sed -i '
/<family lang=\"zh-Hant\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Hant\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant">\n<font weight="100" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="100" \/><\/font>\n<font weight="300" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="3" postScriptName="NotoSansCJKjp-Regular">NotoSansCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<font weight="200" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="200" \/><\/font>\n<font weight="300" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-Regular">NotoSerifCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<\/family>/};
' $MODPATH$FILEPATH$FILE
sed -i '
/<family lang=\"zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Bopo">\n<font weight="100" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="100" \/><\/font>\n<font weight="300" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="3" postScriptName="NotoSansCJKjp-Regular">NotoSansCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<font weight="200" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="200" \/><\/font>\n<font weight="300" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-Regular">NotoSerifCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<\/family>/};
' $MODPATH$FILEPATH$FILE
sed -i '
/<family lang=\"zh-Hant zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Hant zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant zh-Bopo">\n<font weight="100" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="100" \/><\/font>\n<font weight="300" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="3" postScriptName="NotoSansCJKjp-Regular">NotoSansCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<font weight="200" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="200" \/><\/font>\n<font weight="300" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-Regular">NotoSerifCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<\/family>/};
' $MODPATH$FILEPATH$FILE
sed -i '
/<family lang=\"zh-Hant,zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Hant,zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant,zh-Bopo">\n<font weight="100" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="100" \/><\/font>\n<font weight="300" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="3" postScriptName="NotoSansCJKjp-Regular">NotoSansCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="3" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<font weight="200" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="200" \/><\/font>\n<font weight="300" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-Regular">NotoSerifCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="3" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<\/family>/};
' $MODPATH$FILEPATH$FILE
sed -i '
/<family lang=\"ja\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"ja\">.*Noto.*CJK.*<\/family>/<family lang="ja">\n<font weight="100" style="normal" index="0" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="100" \/><\/font>\n<font weight="300" style="normal" index="0" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="0" postScriptName="NotoSansCJKjp-Regular">NotoSansCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="0" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="0" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="0" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="0" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<font weight="200" style="normal" index="0" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="200" \/><\/font>\n<font weight="300" style="normal" index="0" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="0" fallbackFor="serif" postScriptName="NotoSerifCJKjp-Regular">NotoSerifCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="0" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="0" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="0" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="0" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<\/family>/};
' $MODPATH$FILEPATH$FILE
sed -i '
/<family lang=\"ko\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"ko\">.*Noto.*CJK.*<\/family>/<family lang="ko">\n<font weight="100" style="normal" index="1" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="100" \/><\/font>\n<font weight="300" style="normal" index="1" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="1" postScriptName="NotoSansCJKjp-Regular">NotoSansCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="1" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="1" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="1" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="1" postScriptName="NotoSansCJKjp-Thin">NotoSansCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<font weight="200" style="normal" index="1" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="200" \/><\/font>\n<font weight="300" style="normal" index="1" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="300" \/><\/font>\n<font weight="400" style="normal" index="1" fallbackFor="serif" postScriptName="NotoSerifCJKjp-Regular">NotoSerifCJK-Regular.ttc<\/font>\n<font weight="500" style="normal" index="1" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="500" \/><\/font>\n<font weight="600" style="normal" index="1" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="600" \/><\/font>\n<font weight="700" style="normal" index="1" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="700" \/><\/font>\n<font weight="900" style="normal" index="1" fallbackFor="serif" postScriptName="NotoSerifCJKjp-ExtraLight">NotoSerifCJK-VF.otf.ttc<axis tag="wght" stylevalue="900" \/><\/font>\n<\/family>/};
' $MODPATH$FILEPATH$FILE
if [ ! $(cat $MODPATH$FILEPATH$FILE|grep DroidSansFallback.ttf) ]; then
sed -i 's/<\/familyset>/<family>\n<font weight="400" style="normal">DroidSansFallback.ttf<\/font>\n<\/family>\n<\/familyset>/g' $MODPATH$FILEPATH$FILE
fi
sed -i 's/<\/familyset>/<family>\n<font weight="400" style="normal">DroidSansFallbackFull.ttf<\/font>\n<\/family>\n<\/familyset>/g' $MODPATH$FILEPATH$FILE
fi
done
if [ -f $MIRRORPATH$FILECUSTOMPATH$FILECUSTOM ]; then
ui_print "- Migrating $FILECUSTOM"
mkdir -p $MODPATH$CUSTOMTOMOD
cp -af $MIRRORPATH$FILECUSTOMPATH$FILECUSTOM $MODPATH$CUSTOMTOMOD$FILECUSTOM
sed -i '
/<family customizationType=\"new-named-family\" name=\"google-sans-medium\">/,/<\/family>/ {/<\/family>/! d;
/<\/family>/ s/.*/  <alias name="google-sans-medium" to="google-sans" weight="500" \/>/};
/<family customizationType=\"new-named-family\" name=\"google-sans-bold\">/,/<\/family>/ {/<\/family>/! d;
/<\/family>/ s/.*/  <alias name="google-sans-bold" to="google-sans" weight="700" \/>/};
/<family customizationType=\"new-named-family\" name=\"google-sans-text-medium\">/,/<\/family>/ {/<\/family>/! d;
/<\/family>/ s/.*/  <alias name="google-sans-text-medium" to="google-sans-text" weight="500" \/>/};
/<family customizationType=\"new-named-family\" name=\"google-sans-text-bold\">/,/<\/family>/ {/<\/family>/! d;
/<\/family>/ s/.*/  <alias name="google-sans-text-bold" to="google-sans-text" weight="700" \/>/};
/<family customizationType=\"new-named-family\" name=\"google-sans-text-italic\">/,/<\/family>/ {/<\/family>/! d;
/<\/family>/ s/.*/  <alias name="google-sans-text-italic" to="google-sans-text" weight="400" style="italic" \/>/};
/<family customizationType=\"new-named-family\" name=\"google-sans-text-medium-italic\">/,/<\/family>/ {/<\/family>/! d;
/<\/family>/ s/.*/  <alias name="google-sans-text-medium-italic" to="google-sans-text" weight="500" style="italic" \/>/};
/<family customizationType=\"new-named-family\" name=\"google-sans-text-bold-italic\">/,/<\/family>/ {/<\/family>/! d;
/<\/family>/ s/.*/  <alias name="google-sans-text-bold-italic" to="google-sans-text" weight="700" style="italic" \/>/};
' $MODPATH$CUSTOMTOMOD$FILECUSTOM
fi
ui_print "- Migration done."
rm $MODPATH/LICENSE* 2>/dev/null
