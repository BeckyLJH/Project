###############################################################################
# 对上下调差异表达基因画出火山图 
#
# File:        vokano.R
#
# Description:  This program is to draw volcano figure.
#
# Author:       chensheng.
#
# Date:         2/11/2010
#
# Notes:
#
# Changes:
# 
# args[1]:     the statistic test result file name
# 
# args[2]:     the output file png name
#
# args[3]:     p value cutoff in -log10 scale---2 for p=0.01 (bacause -LOG10(0.01)=2 ; -LOG10(0.05)=1.301029996 )
#
# args[4]:    fold change cutoff value (paired---1 stand for -1 & 1)(bacause LOG2(2)=1 ; LOG2(1.5)=0.584962501 )
#
# args[5]:    the output folder
#
# Rscript ./script/vokano.R "./vokano/model_vs_so_t-test_result.txt" "model_vs_so.png" "2" "1" "./vokano/"
# Rscript ./script/vokano.R "./vokano/F1T2_vs_no_acu_t-test_result.txt" "F1T2_vs_no_acu.png" "1.301029996" "1" "./vokano/"
###############################################################################

args <- commandArgs(TRUE);

if (length(args) != 5){
	stop('Wrong arguments!\n');
}
if (!file.exists(args[1])) stop(paste("The ",args[1], " is not exist! Please check your file path!\n",sep=""),call. =F)

data<-read.table(args[1],header = T,check.names=FALSE,sep="\t",stringsAsFactors=FALSE)

data<-as.matrix(data)
if(length(which(colnames(data)=="foldchange"))!=1)  stop("The name of foldchage colunm must be only one!",call. =F)

if(length(which(colnames(data)=="pvalues"))!=1) stop("The name of pvalue colunm must be only one!",call. =F)
 
vx = as.numeric(args[4])

hx =  as.numeric(args[3])

pvalues=data[,"pvalues"];
pvalues<-as.numeric(pvalues);
l=-log(pvalues,10)
foldchange<-data[,"foldchange"];
foldchange<-as.numeric(foldchange);
f=log(foldchange,2)
png(paste(args[5],args[2],sep="/"),,width=720,height=720)

col.v = rep(0,dim(data)[1])

for (i in 1:dim(data)[1]) {
	if (f[i]<=-vx & l[i]>=hx) {
		col.v[i]="blue"
	} else if (f[i]<=0 & l[i]>=hx) {
		col.v[i]="#CCCCFF"
	} else if (f[i]>=vx & l[i]>=hx) {
		col.v[i]="red"
	} else if (f[i]>=0 & l[i]>=hx) {
		col.v[i]="#FFCCCC"
	} else {
		col.v[i]="grey"
	}
}

plot(f,l,main="Volcano Picture of DEG",xlab="log2 ratio",ylab="-log10(P value)",col=col.v,pch=21,bg=col.v,cex=1)
abline(v = c(vx,-vx),h = hx,col="grey")
dev.off()
