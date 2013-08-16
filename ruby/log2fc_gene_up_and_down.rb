#!/usr/bin/env ruby
#coding:utf-8

include Math

usage = "天津樊老师第5批分析：#{$0},将上下调两个文件合并于一个，用于差异表达基因数据整理。
其中fc值为log2(fc)值。
Author: Jiahui Liu<beckyljh@gmail.com>, 2013/08/14"

# 执行范例：ruby log2fc_gene_up_and_down.rb model_vs_so_up.txt model_vs_so_down.txt model_vs_so_diff.txt 0 15 16 17 18 19

if ARGV.size != 9
  $stderr.puts usage
  exit
else
  infile1 = ARGV[0] # 输入文件1，差异表达基因上/下调文件，不含表头
  infile2 = ARGV[1] # 输入文件2，差异表达基因上/下调文件，不含表头
  outf = ARGV[2] # 输出文件名
  geneid = ARGV[3] # gene id所在列
  fc = ARGV[4] # fc值所在列
  p = ARGV[5] # p值所在列
  adjustp = ARGV[6] # adjustp值所在列
  symbol = ARGV[7] # gene symbol所在列
  des = ARGV[8] # gene description所在列  
end

# infile1 = "model_vs_so_up.txt"
# infile2 = "model_vs_so_down.txt"
# outf = "model_vs_so_diff2.txt"
# geneid = "0"
# fc = "15"
# p = "16"
# adjustp = "17"
# symbol = "18"
# des =  "19"

outFile = File.new(outf,"w")
c = 0
File.read(infile1).split("\r\n").each do |l|
	gene = l.split("\t")
	logfc = log2(gene[fc.to_i].to_f)
	outFile.puts("#{gene[geneid.to_i]}\t#{gene[p.to_i]}\t#{gene[adjustp.to_i]}\t+\t#{logfc}\t#{gene[symbol.to_i]}\t#{gene[des.to_i]}")
	c += 1
end
File.read(infile2).split("\r\n").each do |l|
	gene1 = l.split("\t")
	# fc = 1/gene1[15].to_f
	logfc2 = log2(gene1[fc.to_i].to_f)
	outFile.puts("#{gene1[geneid.to_i]}\t#{gene1[p.to_i]}\t#{gene1[adjustp.to_i]}\t-\t#{logfc2}\t#{gene1[symbol.to_i]}\t#{gene1[des.to_i]}")
	c += 1
end

puts c

