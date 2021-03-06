## 大学院情報学研究科　学修計画届　(前期過程)
2021/04/21 提出
### 専攻名
情報システム学専攻

### 所属講座名
計算論

### 氏名
平手　貴大

### 主指導教員
番原　睦則

### 副指導教員
酒井　正彦

### 研究題目
解集合プログラミングを用いたハミルトン閉路問題の解法に関する研究

### 学修・研究計画
ハミルトン閉路問題 (Hamiltonian Cycle Problem) は，与えられたグラフの全頂点をちょうど一度ずつ通る閉路が存在するかどうかを判定する問題である．ハミルトン路問題 (Hamiltonian Path Problem) は，ハミルトン閉路問題から始点と終点が一致するという閉路の条件を取り除いたものである．ハミルトン閉路問題とハミルトン路問題は，どちらも NP 完全な問題である．これらの問題は，重要な工学的応用が数多く存在するため，古くから盛んに研究されている．例えば，数理最適化の分野で有名な巡回セールスマン問題は，グラフの辺に距離が付随しているとき，最短距離のハミルトン閉路を求める最短ハミルトン閉路問題と考えることができる．また，ごく最近では，距離の総和が所与の閾値以下(または以上)であることを制約条件として付加したコスト制約付きハミルトン閉路問題も提案されている．

解集合プログラミング(Answer Set Programming; ASP)は，論理プログラミングから派生した比較的新しいプログラミングパラダイムである．ASP言語は，一階論理に基づく知識表現言語の一種であり，論理プログラムは ASP のルールの有限集合である．ASP システムは論理プログラムから安定モデル意味論に基づく解集合を計算するシステムである．近年，SAT技術を応用した高速 ASP システムが開発され，スケジューリング，プランニング，システム生物学，システム検証，制約充足問題，制約最適化問題など様々な分野への実用的応用が急速に拡大している．

本研究の目的は，ASP 技術を活用し，大規模なハミルトン閉路問題や関連問題を効率よく解くソルバーの実現にある.卒業研究では，3種類のハミルトン閉路問題を解く ASP 符号化を考案し，既存のベンチマーク問題集(7種類，計517問)を用いて実行実験を行なった．大学院ではこれを発展させ，目的達成を目指す．具体的な研究課題は，以下の通りである．

(1)ハミルトン閉路問題をインクリメンタルに解く2種類の手法の実装(2)最短ハミルトン閉路問題やコスト制約付きハミルトン閉路問題(解の全列挙)に対して系統的探索と確率的局所探索を統合的に適用する手法の実装.

また，得られた成果・知見については，積極的に学会等で発表する．