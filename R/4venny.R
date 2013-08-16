# 4个集合求交集，画出维恩图

library(VennDiagram)
setwd("E:")
#data=read.table("venn.data.txt",header = FALSE, sep = "", quote = "\"'")
venn.plot <- draw.quad.venn(
	area1 = 321+52+11+4+52+3089+1000+1420, 
	area2 = 1420+1000+3089+52+415+71+18+10, 
	area3 = 52+1000+71+264+16+18+3089+11,
	area4 = 11+3089+18+16+4+52+10+21,
	n12 = 1420+1000+3089+52,
	n13 = 11+52+1000+3089,
	n14 = 4+52+11+3089,
	n23 = 1000+71+18+3089,
	n24 = 52+10+18+3089,
	n34 = 11+3089+18+16,
	n123 = 3089+1000,
	n124 = 3089+52,
	n134 = 3089+11,
	n234 = 3089+18,
	n1234 = 3089,
	
#	area1 = data[1,1], 
#	area2 = data[2,1], 
#	area3 = data[3,1],
#	area4 = data[4,1],
#	n12 = data[5,1],
#	n13 = data[6,1],
#	n14 = data[7,1],
#	n23 = data[8,1],
#	n24 = data[9,1],
#	n34 = data[10,1],
#	n123 = data[11,1],
#	n124 = data[12,1],
#	n134 = data[13,1],
#	n234 = data[14,1],
#	n1234 = data[15,1],
	category = c("Renzhong/Normal", "Renzhong/so", "Renzhong/model", "Renzhong/no-acu"),
	fill = c("orange", "red", "green", "blue"),
	lty = "dashed",
	cex = 2,
	cat.cex = 0.9,
#	cat.just = list(c(-1, -1), c(1, 1)),
	cat.col = c("orange", "red", "green", "blue")
	);

pdf(file="vennplot_(Renzhong vs Normal)∩(Renzhong vs so)∩(Renzhong vs model)∩(Renzhong vs no-acu).pdf",width=8,height=8)
grid.draw(venn.plot);
dev.off()


library(VennDiagram)
venn.plot <- draw.pairwise.venn(
	area1 = 178, 
	area2 = 162, 
	cross.area = 86, 
	category = c("Renzhong vs Normal", "A1/D4"),
	fill = c("blue", "red"),
	lty = "blank",
	cex = 2,
	cat.cex = 2,
	cat.pos = c(285, 105),
	cat.dist = 0.09,
	cat.just = list(c(-1, -1), c(1, 1)),
	ext.pos = 30,
	ext.dist = -0.05,
	ext.length = 0.85,
	ext.line.lwd = 2,
	ext.line.lty = "dashed"
	);

pdf(file="E:/venn_A1_D4.pdf",width=8,height=8)
grid.draw(venn.plot);
dev.off()


venn.plot <- draw.pairwise.venn(
	area1 = 178, 
	area2 = 158, 
	cross.area = 78, 
	category = c("Renzhong vs Normal", "A1/G7"),
	fill = c("blue", "red"),
	lty = "blank",
	cex = 2,
	cat.cex = 2,
	cat.pos = c(285, 105),
	cat.dist = 0.09,
	cat.just = list(c(-1, -1), c(1, 1)),
	ext.pos = 30,
	ext.dist = -0.05,
	ext.length = 0.85,
	ext.line.lwd = 2,
	ext.line.lty = "dashed"
	);

pdf(file="E:/venn_A1_G7.pdf",width=8,height=8)
grid.draw(venn.plot);
dev.off()