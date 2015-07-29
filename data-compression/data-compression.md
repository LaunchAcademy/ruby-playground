### Learning Goals

* Understand what data compression is
* Recognize the difference between *lossy* and *lossless* compression
* Learn how to calculate the memory costs of the length of an ASCII text string
* Understand how to manipulate a string to lower its total memory cost

### Why Do We Compress Data?

You probably have heard of file archive formats like `zip` or `gz` or `tar` that are used in data compression. Broadly speaking, we care about compressing data for a couple of reasons: (1) to save space; and (2) to save time. If we are able to cut the size of a file, then we can store more data on a device where our storage might have been limited. Similarly, if we need to transmit data over a network, we can save time by sending a compressed version of our data. Does it matter if the uncompressed data is identical with the original source?

There are two types of compression: (1) lossless compression; and (2) lossy compression. The differences reflect the names. A compressed file implementing a lossless compression method, an uncompressed version contains identical data as the original pre-compressed version. An example of lossless data compression is a ZIP file. Lossy compression is a little different. If the uncompressed file contains data that differs from the original, we call such compression lossy. Audio and image files like MP3 and JPG compression methods are an example of lossy compression.

### An Example

In this challenge, we will be looking at lossless compression, particularly in the case of text compression. How would compression work in the case of text? Often in text, there is a great deal of repetitive and redundant information. Consider the following two strings:

```
(1) 2PAC NOT DRE
(2) 2PAC = TUPAC
```

In ASCII text, each character’s cost is a single 8-bit byte. The total cost of (1) is 12 bytes (a space costs 1 byte) or 96 bits. Similarly, the cost of (2) is also 96 bits, but there is some repetitive text: “PAC" in particular. So what if we can replace “PAC” with a single byte instead of 3? In that case, (2)’s total cost would be 80 bits, which would result in a compression ratio of 1.2 (compression ratio is calculated as uncompressed data / compressed data). While a compression ratio of 1.2 isn’t very good, the more text that is compressed, the more redundant data can be replaced, resulting in a better compression ratio. Visualizing a string like “2PAC 3PAC 4PAC 5PAC 6PAC . . . 1000PAC” should make this idea clear.

### Requirements

Write a program called data-compression.rb that compresses a text file. See below for an example of how this program could compress a text file:

To compress a file (using Kant's Fundamental Principles of the Metaphysic of Morals as an example), in your terminal, run the following command:

```no-highlight
ruby data-compression.rb -c fundamental_kant.txt
```

You should see a printout like the one below and your current folder will now have a file called fundamental_kant.txt.compressed:

```no-highlight
fundamental_kant.txt.compressed created
________________________________________________________
Original file name     : fundamental_kant.txt
Compressed file name   : fundamental_kant.txt.compressed
Original file size     : 176K
Compressed file size   : 71K
Compression took 0.1989 seconds
Compressed file is 59.7% smaller than the original file
Compression Ratio: 2.48 x
________________________________________________________
```

To uncompress the .compressed file:

```no-highlight
ruby data-compression.rb -u fundamental_kant.txt.compressed
```

Your current folder will now have _fundamental_kant.txt which will contain the uncompressed text.

The printout will look like the one below:

```no-highlight
file uncompressed
_fundamental_kant.txt created
```

###Hints
For purposes of this project, avoid using the ZLIB library. There are some great resources on the web that discuss various compression algorithms. A few in particular like a `Huffman` algorithm or `LZW compression` might be worth looking at here.
