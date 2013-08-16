# 3个集合求交集，画出维恩图
# 统计7个数值，分别为1、2、3、1∩2、1∩3、2∩3、1∩2∩3，但做GO和Pathway以及整理数据时
# 需统计的是1-2-3、2-1-3、3-1-2、1∩2-3、1∩3-2、2∩3-1、1∩2∩3

library(VennDiagram)
library(grid)
venn.plot <- draw.triple.venn(
	area1 = 719, 
	area2 = 689, 
	area3 = 361,
	n12 = 212,
	n13 = 77,
	n23 = 73,	
	n123 = 25,
	category = c("F1T2_vs_no_acu", "F2T2_vs_no_acu", "F3T2_vs_no_acu"),
	fill = c("blue", "red", "green"),
	lty = "blank",
	cex = 2,
	cat.cex = 2,
	cat.col = c("blue", "red", "green"),
	cat.just = list(c(0, 1), c(1, 1), c(0,-2))
	);
pdf(file ="E:/venny.pdf",width=6,height=6)
grid.draw(venn.plot);
dev.off();