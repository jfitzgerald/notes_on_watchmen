Generate Colors
---------------

JPG -> PNG -> websafe -> histgram

Prepare:
A folder named Chapter01 of JPG files named wm-C#-P#.jpg.
Where C# is the chapter number, 1.
Where P# is the page number, 9, 12, or 26.

Chapter 1, Cover: wm-1-0.jpg
Chapter 1, Page 12: wm-1-12.jpg

1. jpg_to_png.sh

```
cd ~/Code/notes_on_watchmen/bin/image_utils
./jpg_to_png.sh ~/Pictures/watchmen/Chapter01
```

2. websafe.sh

```
cd ~/Code/notes_on_watchmen/bin/image_utils
./websafe.sh ~/Pictures/watchmen/Chapter01/png
```

3. histogram

```
cd ~/Code/notes_on_watchmen/bin/image_utils
./histogram.sh ~/Pictures/watchmen/Chapter01/png/websafe
```

4. Generate Page Color Data

```
./gen_color_data.pl ~/Pictures/watchmen/Chapter01/png/websafe/hist/*.txt > ../data/colors/chapter1.json
```

5. Update Master Color List

```
cd ~/Pictures/watchmen/Chapter01/png/websafe/hist/
cat *.txt > chapter-hist.txt
cd ~/Code/notes_on_watchmen/bin/
./gen_colors.pl ~/Pictures/watchmen/Chapter01/png/websafe/hist/chapter-hist.txt
```


6. Generate Pages
