# 中間発表用スライド構成

## 表紙
+ 題名()
+ 名前(小菅脩司)
+ 所属(番原研究室)
+ 発表する回(番原研中間発表)

## 背景理論付きSAT(Satisfiable Modulo Theories:SMT)
<!-- + SMT とは -->
<!--     + 命題論理よりも表現能力の高い論理体系で記述された背景論理を、SAT技法で効率的に取り扱うことを目的としている -->
<!-- + z3 とは -->
<!--     + Microsoft Researchが開発したSMTソルバ。 -->
<!-- + SMTの使用例 -->
<!-- + SMTの特長(長所) -->
+ satとの比較
+ smtの利点

## distinct制約
+ $distinct(x1 ... x_n)$は変数x_iが互いに異なる値をとることを意味する。
+ 今回実験に使用したSMTソルバのうちの1つであるz3においてこの制約は、$\bigwedge_{1 \leq i < j \leq n} x_i \neq x_j$に分解される。
+ distinct制約の欠点

## 研究概要
+ 研究目的
    + distinct制約の高速化
+ 研究内容
    + 性能の比較


## 符号化方法1
+ distinct制約にヒントを追加する。
    + $distinct(x_1 ... x_n)$について、$x_i \in {l,l+1,...,u}$かつu-l=n-1であるときに以下の制約を追加する。
        + $\bigvee_{i=1}^n z_i=a (a \in {l,l+1,...,u})$
    + 各値aに対し、その値をとる変数$x_i$が存在する。

## 符号化方法2
+ ブール基数制約へと符号化する。

## クイーングラフ彩色問題
NxNの大きさのチェス盤に、N色のクイーンをN個ずつ互いに取り合わないように配置する問題。
各行、各列、各右上がり対角線、各右下がり対角線に配置されているクイーンの色が互いに異なる。

## 実験概要
+ ベンチマーク問題
    + クイーングラフ彩色問題 N=5~13
+ SMTソルバ: z3(ver.4.8.9)
+ 制限時間: 1問あたり2時間
+ 実験環境: Mac mini, 3.2GHz, 64GB メモリ

## 実験結果

## まとめ
+ まとめ
    + 研究内容とほぼ同じ
+ 今後の課題
    + ブール基数制約モデルとの性能比較
    + 新たなdistinct制約の符号化の提案
        + カーネルを使用するモデル

## (補足スライド) SMTソルバについて
## (補足スライド)クイーングラフ彩色問題

## (補足スライド) 色変数モデル
クイーンの色を整数変数とした制約モデル

## (補足スライド) 位置変数モデル
各行に配置されるクイーンの列番号を整数変数とした制約モデル
## (補足スライド) 手法3
## (補足スライド) 手法4
## (補足スライド) カーネルとは

TikZ