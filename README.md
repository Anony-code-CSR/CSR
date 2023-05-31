# CSR+: A Scalable Efficient CoSimRank Search Algorithm with Multi-Source Queries on Massive Graphs

## Environment:
- Windows 10
- Intel Core i7-10700 CPU @ 2.9GHz and 32GB RAM
- Matlab R2021a

## Main:
(1) Time\
cd MQ_Time/ \
run main_Time.m.

  
(2) Memory \
cd MQ_Mem/ \
run main_Mem.m.

(3) Accuracy\
cd MQ_Acc/ \
 run main_Acc.m

(4) Test_Example： Experimental verification of Examples 1 and 2 in the paper
> $//$ Example_1： duplicate computations in CoSimRank search $[S]_{*,\boldsymbol{Q}}$ with Multi-Source Queries $\boldsymbol{Q} =${b,d} on Graph $\boldsymbol{G}$;\
> $//$ Example_2： the detailed processing of each step of the CSR+ algorithm.
  
## Compared Algorithms:

CSR+： Our algorithm;\
CSR-NI： a non-iterative method using low-rank SVD approximation and tensor products for CoSimRank search.\
CSR-IT： an iterative CoSimRank method.\
CSR-RLS： an efficient single-source similarity computing method applied to CoSimRank search.  

## Datasets:
We use real-life datasets publicly available on SNAP：http://snap.stanford.edu/data/

Erdos981  (ED)：Erdos collaboration network\
ego-Facebook  (FB)：Social friendship from ego-Facebook\
p2p-Gnutella25 (P2P)：Gnutella peer-to-peer network\
web-NotreDame (WN)：Web graph from Univ of Notre Dame\
com-Youtube (YT)：Youtube social network communities\
wiki-Talk (WT)：Wikipedia talk (communication) graph
