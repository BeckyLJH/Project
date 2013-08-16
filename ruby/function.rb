#!/usr/bin/env ruby
#coding:utf-8

usage = "天津樊老师第5批分析：#{$0},将GO和Pathway文件合并于一个，用于基因功能富集数据整理。
Author: Jiahui Liu<beckyljh@gmail.com>, 2013/08/14"

outFile = File.new("result/model_vs_so_up.txt","w")
c = 0
File.read("GO_EA_model_vs_so_up.txt").split("\r\n").each do |l|
	gene = l.split("\t")
	 outFile.puts("#{gene[2]}\t#{gene[0]}\t#{gene[1]}\t#{gene[3]}\t#{gene[4]}\t#{gene[9]}\t#{gene[10]}\t#{gene[7]}\t#{gene[8]}")
	 c += 1
end
File.read("Pathway_EA_model_vs_so_up.txt").split("\r\n").each do |l|
	gene1 = l.split("\t")
	 outFile.puts("KEGG\t#{gene1[0]}\t#{gene1[1]}\t#{gene1[2]}\t#{gene1[3]}\t#{gene1[8]}\t#{gene1[9]}\t#{gene1[6]}\t#{gene1[7]}")
	 c += 1
end

puts c