#!/usr/bin/env ruby
#coding:utf-8

usage = "天津樊老师第5批分析：#{$0},将geneset文件合并成一个，并标明每个基因属于哪个geneset。
Author: Jiahui Liu<beckyljh@gmail.com>, 2013/08/14"

# 执行范例：ruby 3venny_genesets_tongji.rb F1T2-F2T2-F3T2.txt F2T2-F1T2-F3T2.txt F3T2-F1T2-F2T2.txt F1T2+F2T2-F3T2.txt F1T2+F3T2-F2T2.txt F2T2+F3T2-F1T2.txt F1T2+F2T2+F3T2.txt genesets.txt 0 18


if ARGV.size != 10
  $stderr.puts usage
  exit
else
  infile1 = ARGV[0] # set1-set2-set3
  infile2 = ARGV[1] # set2-set1-set3
  infile3 = ARGV[2] # set3-set1-set2
  infile4 = ARGV[3] # set1+set2-set3
  infile5 = ARGV[4] # set1+set3-set2
  infile6 = ARGV[5] # set2+set3-set1
  infile7 = ARGV[6] # set1+set2+set3，以上7个文件必须按顺序输入
  outf = ARGV[7] # 输出文件名
  geneid = ARGV[8] # gene id所在列
  symbol = ARGV[9] # gene symbol所在列 
end

# infile1 = "F1T2-F2T2-F3T2.txt"
# infile2 = "F2T2-F1T2-F3T2.txt"
# infile3 = "F3T2-F1T2-F2T2.txt"
# infile4 = "F1T2+F2T2-F3T2.txt"
# infile5 = "F1T2+F3T2-F2T2.txt"
# infile6 = "F2T2+F3T2-F1T2.txt"
# infile7 = "F1T2+F2T2+F3T2.txt"
# outf = "genesets.txt"
# geneid = "0"
# symbol = "18"

outFile = File.new("genesets.txt","w")

File.read(infile1).split("\n").each do |l|
	gene = l.split("\t")
	 outFile.puts("#{gene[geneid.to_i]}\t#{gene[symbol.to_i]}\tset1-set2-set3")
end
File.read(infile2).split("\n").each do |l|
	gene1 = l.split("\t")
	 outFile.puts("#{gene1[geneid.to_i]}\t#{gene1[symbol.to_i]}\tset2-set1-set3")
end
File.read(infile3).split("\n").each do |l|
	gene2 = l.split("\t")
	 outFile.puts("#{gene2[geneid.to_i]}\t#{gene2[symbol.to_i]}\tset3-set1-set2")
end
File.read(infile4).split("\n").each do |l|
	gene3 = l.split("\t")
	 outFile.puts("#{gene3[geneid.to_i]}\t#{gene3[symbol.to_i]}\tset1+set2-set3")
end
File.read(infile5).split("\n").each do |l|
	gene4 = l.split("\t")
	 outFile.puts("#{gene4[geneid.to_i]}\t#{gene4[symbol.to_i]}\tset1+set3-set2")
end
File.read(infile6).split("\n").each do |l|
	gene5 = l.split("\t")
	 outFile.puts("#{gene5[geneid.to_i]}\t#{gene5[symbol.to_i]}\tset2+set3-set1")
end
File.read(infile7).split("\n").each do |l|
	gene6 = l.split("\t")
	 outFile.puts("#{gene6[geneid.to_i]}\t#{gene6[symbol.to_i]}\tset1+set2+set3")
end

