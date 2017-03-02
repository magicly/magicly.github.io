title: 在markdown里如何写数学公式
tags: [math]
category: ML
date: 2017-03-02 11:16:16
---

最近准备写一下机器学习的一些学习笔记， 由于涉及到大量数学公式， 发现不把如何在markdown里写数学公式这个问题解决了会严重影响工作效率。大概而言， 主要有两种方式：

<!-- more -->
1. 用图片！
也就是编辑好公式，上传，然后在markdown里面引用图片链接的方式。这种方式方便直接，但是显得比较low一点。 有兴趣的可以参考这几篇文章。
* http://www.ruanyifeng.com/blog/2011/07/formula_online_generator.html 
当然， 在某些情况下， 必须使用这种思路。 比如， 微信公众号里。 可以参考[这里](http://www.52nlp.cn/%E5%9C%A8%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7%E9%87%8C%E4%BD%BF%E7%94%A8latex%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F)

2. 用Mathjax插件来写LaTex公式。
哪怕你是用图片， 那也得写出LaTex公式啊。所以我们今天主要讲第二种方式。推荐[这个工具](https://webdemo.myscript.com/views/math.html)，可以直接在浏览器里手写公式，它会帮你转为LaTex！很好很强大。


# MathJax插件
著名的Stackoverflow网站上的漂亮公式，就是使用了MathJax插件的效果。添加MathJax插件也非常简单，只需要在markdown文件中，添加MathJax CDN，如下：
```
<script type="text/javascript"
   src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
```
就可以在md文件中插入Tex格式的公式了。

行间公式的形式为
```
$$ 此处插入公式 $$
```
而行内公式的形式为
```
\\( 此处插入公式 \\)
```


# Hexo中显示数学公式
Hexo原生不支持数学公式， 因此需要我们做一些修改。安装[hexo-math](https://github.com/akfish/hexo-math)插件：

```
npm install hexo-math --save
```
在_config.yml中增加
```
plugins:
  hexo-math
 ```

完事大吉， 你现在可以写LaTex公式了， 我们来写几个看看。

这是行内公式根号2这样写: \\(\\sqrt{2}\\)
```
\\(\\sqrt{2}\\)
```
这是单独一行的公式:
```
$$ a ^ 2 + b ^ 2 = c ^ 2 $$
$$ \sqrt{2} $$
$$ evidence\_{i}=\sum \_{j}W\_{ij}x\_{j}+b\_{i} $$
```
$$ a ^ 2 + b ^ 2 = c ^ 2 $$
$$ \sqrt{2} $$
$$ evidence\_{i}=\sum \_{j}W\_{ij}x\_{j}+b\_{i} $$
细心的同学会发现， 里面有很多**\\\\**, **\\_**之类， 原因是**\\**本身在markdown和LaTex里都有含义， 因此需要转义。但是LaTex里面， **\\**太常用了， 所以每次遇到都转义的话就很痛苦， 而且在hexo里面写的公式，复制到其他地方去就不支持了。

网上有改hexo渲染的源码的， 有换用pandoc的， 其实最简单的方式是用hexo-math里的tag。网上搜索到的很多资料都是用的{&#37; math_block %}，我试了发现总是不对， 后来看[官网](https://github.com/akfish/hexo-math)，发现这个方法已经deprecated了， 最新的用{&#37; math %}，如下：

```
这是行内公式：{% math %}\sqrt{2 + 3}{% endmath %}
```
显示为：这是行内公式：{% math %}\sqrt{2 + 3}{% endmath %}
一行公式：
```
$$ evidence\_{i}=\sum \_{j}W\_{ij}x\_{j}+b\_{i} $$

{% math %}
\begin{aligned}
evidence_{i}=\sum _{j}W_{ij}x_{j}+b_{i}
\end{aligned}
{% endmath %}
```
$$ evidence\_{i}=\sum \_{j}W\_{ij}x\_{j}+b\_{i} $$
{% math %}
\begin{aligned}
evidence_{i}=\sum _{j}W_{ij}x_{j}+b_{i}
\end{aligned}
{% endmath %}
可以看出， 如果有需要转义的字符， 用{&#37; math %}tag这种方式要好很多。

再来一个复杂点的公式， 这是[word2vec](https://www.tensorflow.org/tutorials/word2vec)的损失函数公式（选中公式， 右键可以查看LaTex源码）：
```
{% math %}
J_\text{NEG} = \log Q_\theta(D=1 |w_t, h) +
  k \mathop{\mathbb{E}}_{\tilde w \sim P_\text{noise}}
     \left[ \log Q_\theta(D = 0 |\tilde w, h) \right]
{% endmath %}
```
{% math %}
J_\text{NEG} = \log Q_\theta(D=1 |w_t, h) +
  k \mathop{\mathbb{E}}_{\tilde w \sim P_\text{noise}}
     \left[ \log Q_\theta(D = 0 |\tilde w, h) \right]
{% endmath %}

经过简单的配置， 我们的web页面已经可以支持很方便的书写数学公式了，而且由于不用特殊转义， 这里写的LaTex可以在其他markdown环境下使用， 比如[有道云笔记](http://mp.weixin.qq.com/s?__biz=MjM5NjAyNjkwMA==&mid=2723942529&idx=1&sn=3b417dd77b4d5b92231ed59649844eb9&chksm=81473ffab630b6ec843d77432c487e3e3a272ec26a5b9e0ae4007f5fce3dd826825a7b64a249&mpshare=1&scene=1&srcid=0301zj3JKl85H692JGwUHZzM#rd)。
