#!/usr/bin/env ruby
#coding:utf-8

usage = "天津樊老师第5批分析：#{$0},3组取交集，统计7个数值，用于3venny.R作图。
分别为1、2、3、1∩2、1∩3、2∩3、1∩2∩3，
并生成1-2-3、2-1-3、3-1-2、1∩2-3、1∩3-2、2∩3-1、1∩2∩3共7个文件，以便进行GO和Pathway及数据整理。
Author: Jiahui Liu<beckyljh@gmail.com>, 2013/08/13"

# 执行范例：ruby 3venny.rb 1.txt 2.txt 3.txt false 0

if ARGV.size != 5
  $stderr.puts usage
  exit
else
  infile1 = ARGV[0] # 第一个文件名
  infile2 = ARGV[1] # 第二个文件名
  infile3 = ARGV[2] # 第三个文件名
  head = ARGV[3] # 是否含表头，要么都有，要么都没有，值为"TRUE" "FALSE"
  common = ARGV[4] # 3个文件相关联的是第几列，如GeneID所在第0列
end


hash1 = {}
hash2 = {}
hash3 = {}
c1 = 0
c2 = 0
c3 = 0
c12 = 0
c13 = 0
c23 = 0
c123 = 0
outFile1 = File.new(infile1.split(".")[0]+"-"+infile2.split(".")[0]+"-"+infile3.split(".")[0]+".txt","w")
outFile2 = File.new(infile2.split(".")[0]+"-"+infile1.split(".")[0]+"-"+infile3.split(".")[0]+".txt","w")
outFile3 = File.new(infile3.split(".")[0]+"-"+infile1.split(".")[0]+"-"+infile2.split(".")[0]+".txt","w")
outFile4 = File.new(infile1.split(".")[0]+"+"+infile2.split(".")[0]+"-"+infile3.split(".")[0]+".txt","w")
outFile5 = File.new(infile1.split(".")[0]+"+"+infile3.split(".")[0]+"-"+infile2.split(".")[0]+".txt","w")
outFile6 = File.new(infile2.split(".")[0]+"+"+infile3.split(".")[0]+"-"+infile1.split(".")[0]+".txt","w")
outFile7 = File.new(infile1.split(".")[0]+"+"+infile2.split(".")[0]+"+"+infile3.split(".")[0]+".txt","w") 

File.read(infile1).split("\r\n").each do |l|
  gene1 = l.split("\t")
  if (gene1[common.to_i] != "") || (gene1[common.to_i] != nil)
    hash1[gene1[common.to_i]] = l
  end
end

File.read(infile2).split("\r\n").each do |l|
  gene2 = l.split("\t")
  if (gene2[common.to_i] != "") || (gene2[common.to_i] != nil)
    hash2[gene2[common.to_i]] = l
  end
end

File.read(infile3).split("\r\n").each do |l|
  gene3 = l.split("\t")
  if (gene3[common.to_i] != "") || (gene3[common.to_i] != nil)
    hash3[gene3[common.to_i]] = l
  end
end

hash1.each do |k1,v1|
  c1 += 1
  if hash2.key?k1
    c12 += 1
    if hash3.key?k1
      c123 += 1
      outFile7.puts v1
    else
      outFile4.puts v1
    end
  else
    if hash3.key?k1
      outFile5.puts v1
    else
      outFile1.puts v1
    end
  end
end

hash2.each do |k2,v2|
  c2 += 1
  if hash3.key?k2
    c23 += 1
    if hash1.key?k2
      next
    else
      outFile6.puts v2
    end
  else
    if hash1.key?k2
      next
    else
      outFile2.puts v2
    end
  end
end

hash3.each do |k3,v3|
  c3 += 1
  if (!(hash1.key?k3)) && (!(hash2.key?k3))
    outFile3.puts v3
  elsif hash1.key?k3
    c13 += 1
  end
end

if head.upcase == "TRUE"
  puts "c1=#{c1-1}"
  puts "c2=#{c2-1}"
  puts "c3=#{c3-1}"
elsif head.upcase == "FALSE"
  puts "c1=#{c1}"
  puts "c2=#{c2}"
  puts "c3=#{c3}"	
end	
puts "c12=#{c12}"
puts "c13=#{c13}"
puts "c23=#{c23}"
puts "c123=#{c123}"

