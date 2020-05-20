[toc]

# flex & grid Layout 

## flex

浏览器适配 https://caniuse.com/#search=css%20flex

![image-20200417114924739](flex & grid Layout.assets/image-20200417114924739.png)

.box 容器

.item 项目

```html
<div class=".box">
    <div class=".item"></div>
    <div class=".item"></div>
    <div class=".item"></div>
</div>
```

注: 设为 Flex 布局以后，子元素的`float`、`clear`和`vertical-align`属性将失效

### 1 主轴和交叉轴

```css
/*容器配置属性, 行内呈现inline-flex*/
.box {
    display: flex;
}
```

默认方向

![image-20200417082654970](flex & grid Layout.assets/image-20200417082654970.png)



### 2 容器属性

#### 2.0 RESUME

- fllex-direction 主轴方向
- flex-wrap 换行
- flex-flow  简写(主轴方向 + 换行)
- justify-content 主轴排列
- align-items 交叉轴对齐
- align-content 交叉轴排列

#### 2.1 flex-direction

默认 row

```css
.box {
    ...
    flex-direction: row | column | row-reverse | column-reverse
}
```

![image-20200417084420284](flex & grid Layout.assets/image-20200417084420284.png)

#### 2.2 flex-wrap

默认 nowrap, 项目排列在一条轴线上

```css
.box {
    ...
    flex-wrap: wrap
}
```

![image-20200417084604211](flex & grid Layout.assets/image-20200417084604211.png)

#### 2.3 flex-flow

默认 row nowrap

```css
.box {
    ...
    flex-flow: <flex-direction> <flex-wrap>
}
```

#### 2.4 justify-content

默认 flex-start

- space-between 两端对齐, 项目间隔相等
- space-around 每单个项目两侧边距相等, 所以项目间间隔会比与边框的间隔要大一倍
- spcae-evenly  **均分** 到项目, 到边框的间隔都相等

注: margin仍然是可用的

```css
.box {
	...
    justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly
}
```

![image-20200417090407356](flex & grid Layout.assets/image-20200417090407356.png)

#### 2.5 align-items

一行中项目在交叉轴上的对齐方式

默认 stretch 若项目未设置高度或设为auto, 将占满整个容器高度

```css
.box {
    ...
    align-items: flex-start | flex-end | center | baseline | stretch
}
```

![image-20200417093231673](flex & grid Layout.assets/image-20200417093231673.png)

#### 2.6 align-content

行与行之间在交叉轴上的排列方式

默认 stretch 交叉轴等分, 项目在单个等分区域起点对齐

```css
.box {
    ...
    align-content: flex-start | flex-end | center | space-between | sapce-around | stretch
}
```

![image-20200417095144641](flex & grid Layout.assets/image-20200417095144641.png)



### 3 项目属性

#### 3.0 RESUME

- order 排列顺序
- flex-grow 项目放大比例
- flex-shrink 项目缩小比列
- flex-basis 项目基准大小
- flex 简写(flex-grow flex-shrink flex-basis)
- align-self 单个项目对齐

#### 3.1 order

默认 0

```css
.item {
	order: <integer>;
}
```

![image-20200417095627210](flex & grid Layout.assets/image-20200417095627210.png)

#### 3.2 flex-grow

瓜分容器内剩余空间

默认 0 存在剩余, 也不放大

```css
.item {
	flex-grow: <number>;
}
```

如果所有项目的`flex-grow`属性都为1，则它们将等分剩余空间（如果有的话）。如果一个项目的`flex-grow`属性为2，其他项目都为1，则前者占据的剩余空间将比其他项多一倍。

![image-20200417100140969](flex & grid Layout.assets/image-20200417100140969.png)

#### 3.3 flex-shrink

默认 1 若空间不足, 多出的空间等比分配, 项目缩小

```css
.item {
	flex-shrink: <number>
}
```

如果所有项目的`flex-shrink`属性都为1，当空间不足时，都将等比例缩小。如果一个项目的`flex-shrink`属性为0，其他项目都为1，则空间不足时，前者不缩小。

![image-20200417100623577](flex & grid Layout.assets/image-20200417100623577.png)

#### 3.4 flex-basis

分配空间前, 项目大小, 权重高于width/height

默认 auto 即项目原本的大小

```css
.item {
	flex-basis: <length> | auto;
}
```

#### 3.5 flex

默认 0 1 auto, 后两个值可选

省略时, flex: x = flex: x 0 0;  此时, basis为0, width/height无效, 不存在需要shrink的情况

```css
.item {
	flex: auto | none | <flex-grow> (<flex-shrink> <flex-basis>);
}
```

- **flex: 1** = flex:  1 0 0  项目尺寸扩大, 占剩余空间一份, 不考虑原尺寸大小; 通常用于填满主轴空间或者设置同样属性, 等分整个容器, 达到尺寸相等的效果
- flex: 2 = flex: 2 0 0  项目尺寸扩大, 占剩余空间两份, 不考虑原尺寸大小
- **flex: auto** = flex: 1 1 auto  项目尺寸扩大, 考虑原尺寸大小
- **flex: none** = flex: 0 0 auto 保留原先尺寸大小, 不放大也不缩小

#### 3.6 align-self

默认 auto 继承align-items

权重较align-items高

```css
.item {
	align-self: auto | flex-start | flex-end | center | baseline | stretch
}
```

![image-20200417104818491](flex & grid Layout.assets/image-20200417104818491.png)

## grid

浏览器适配 https://caniuse.com/#feat=css-grid

![image-20200417115313197](flex & grid Layout.assets/image-20200417115313197.png)

```html
<div class="wrapper">
    <div class="item">1</div>
    <div class="item">2</div>
    <div class="item">3</div>
    <div class="item">4</div>
    <div class="item">5</div>
    <div class="item">6</div>
    <div class="item">7</div>
    <div class="item">8</div>
    <div class="item">9</div>
</div>
```

wrapper 容器 

item 项目

```css
.wrapper {
    display: grid | inline-grid;
}
```

正常情况下，`n`行有`n + 1`根水平网格线，`m`列有`m + 1`根垂直网格线，比如三行就有四根水平网格线

<img src="flex & grid Layout.assets/image-20200417153624113.png" alt="image-20200417153624113" style="zoom:33%;" />

注: 设为网格布局以后，容器子元素（项目）的`float`、`display: inline-block`、`display: table-cell`、`vertical-align`和`column-*`等设置都将失效

### 1 相关名词

**网格线**

<img src="flex & grid Layout.assets/image-20200417142337342.png" alt="image-20200417142337342" style="zoom: 33%;" />

**网格轨道**

<img src="flex & grid Layout.assets/image-20200417142501032.png" alt="image-20200417142501032" style="zoom: 33%;" />

**网格单元**

<img src="flex & grid Layout.assets/image-20200417142612016.png" alt="image-20200417142612016" style="zoom: 33%;" />

**网格区域**(项目所占的网格空间)

<img src="flex & grid Layout.assets/image-20200417142736705.png" alt="image-20200417142736705" style="zoom: 33%;" />

### 2 容器属性

#### 2.0 RESUME

- grid-template-columns / grid-template-rows 行高列宽
- row-gap / column-gap / gap 行列间距
- grid-template-areas 网格区域分配
- grid-auto-flow 网格区域自动排放顺序
- justify-items / align-items / place-items 项目在网格区域里水平 / 垂直对齐方式 / 简写
- justify-content / align-content / place-content 网格区域在容器里水平 / 垂直对齐方式 / 简写
- grid-auto-rows / grid-auto-columns 自动添加的网格单元行高 / 列宽
- grid-template / grid 简写

#### 2.1 grid-template-columns / grid-template-rows

##### 2.1.1 basis use

默认 1 列

单位可以是具体数值, 百分比, 或者fr片段单位; 

权重: 列宽/行高的具体尺寸(px, rem...%) > 项目width/height

设置了列宽后, **默认行高 = 可分配容器高度/ (项目数/列数**, 向上取整 **) ** 

```css
.wrapper {
    ...
    grid-template-columns: 33.33% 33.33% 33.33%;
}
```

<img src="flex & grid Layout.assets/image-20200417145238048.png" alt="image-20200417145238048" style="zoom:50%;" />

##### 2.1.2 keyword: fr

按比例分配可分配的空间尺寸(容器尺寸 - 具体尺寸)

```css
.wrapper {
    ...
    grid-template-columns: 150px 1fr 2fr;
}
```

<img src="flex & grid Layout.assets/image-20200417151903693.png" alt="image-20200417151903693" style="zoom:50%;" />

##### 2.1.3 repeat(para1, para2)

重复尺寸

- para1: 重复次数

- para2: 尺寸模式

~~~css
.wrapper {
    ...
    grid-template-columns: repeat(3, 33.33%);/*效果同上*/
}
~~~

```css
.wrapper {
	...
	grid-template-colums: repeat(2, 100px 20px 80px);
}
```

<img src="flex & grid Layout.assets/image-20200417150423523.png" alt="image-20200417150423523" style="zoom:50%;" />

##### 2.1.4 keyword: auto-fill

个数不确定但项目尺寸确定时, 自动填充, 直至放不下

```css
.wrapper {
	...
	grid-template-columns: repeat(autofill, 100px)
}
```

##### 2.1.5 minmax(para1, para2)

项目尺寸区间[para1, para2]

```css
.wrapper {
    ...
    grid-template-colums: 1fr 1fr minmax(100px, 1fr);
}
```

表示列宽不小于`100px`，不大于`1fr`

##### 2.1.6 keyword: auto

自适应容器可分配尺寸

```css
.wrapper {
	...
	grid-template-columns:100px auto 100px;
}
```

此时, 不宜适用fr尺寸, auto对应项目的尺寸只会是内容撑起的尺寸

##### 2.1.7 定义网格线的名称

命名为了后续使用

```
.wrapper {
	...
	grid-template-columns: [c1] 1fr [c2] 1fr [c3] 1fr [c4];
	grid-template-rows: [r1] 1fr [r2] 1fr [r3] 1fr [r4]
}
```

允许同一网格线多个名称, 如[c1 left-line]

#### 2.2 row-gap / column-gap / gap

网格单元的实际尺寸大小并没减小, 且与边框并不产生间距

margin仍起作用

```css
.wrapper {
    ...
    row-gap: 20px;
    column-gap: 20px;
}
```

<img src="flex & grid Layout.assets/image-20200417161025447.png" alt="image-20200417161025447" style="zoom:50%;" />

```css
/*省略第二个值时, 相当于row-gap = column-gap设置*/
.wrapper {
    ...
    gap: <row-gap> <column-gap>;
}
```

#### 2.3 grid-template-areas

网格区域可以由一个或多个单元格组成

通常与项目属性 grid-area配合使用

```css
/*将容器划分为a~i九个区域, 每个区域对应一个单元格*/
.wrapper {
	...
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: repeat(3, 1fr);
    grid-template-areas: "a b c"
        				 "d e f"
        				 "g h i";
}
```

```css
/*合并单元格*/
.wrapper {
    ...
    grid-template-areas: "header header header"
        				 "main main sidebar"
        				 "footer footer footer"
}
```

```css
/*不需要的网格单元用.代替*/
.wrapper {
    ...
    grid-template-areas: "header . ."
        				 "main main sidebar"
        				 "footer footer footer"
}
```

<img src="flex & grid Layout.assets/image-20200417172548403.png" alt="image-20200417172548403" style="zoom: 50%;" />

注: 区域的命名会影响到网格线。每个区域的起始网格线，会自动命名为`区域名-start`，终止网格线自动命名为`区域名-end`。

比如，区域名为`header`，则起始位置的水平网格线和垂直网格线叫做`header-start`，终止位置的水平网格线和垂直网格线叫做`header-end`

#### 2.4 grid-auto-flow

默认: row 先行再列

```css
.wrapper {
	...
    grid-auto-flow: row | column | row dense | column dense
}
```

- row 先行再列

  <img src="flex & grid Layout.assets/image-20200422153254860.png" alt="image-20200422153254860" style="zoom:33%;" />

- column 先列在行

  <img src="flex & grid Layout.assets/image-20200422153341360.png" alt="image-20200422153341360" style="zoom:33%;" />

- row dense 先行再列, 紧密排列

  ```css
  .item-1 {
  	grid-column-start: 1;
  	grid-column-end: 3;
  }
  .item-2 {
  	grid-column-start: 1;
  	grid-column-end: 3;
  }
  ```

  默认row 如下:

  <img src="flex & grid Layout.assets/image-20200422160619005.png" alt="image-20200422160619005" style="zoom:33%;" />

  row dense 如下:

  ​			                              <img src="flex & grid Layout.assets/image-20200422161232682.png" alt="image-20200422161232682" style="zoom:33%;" />

- column dense 先列再行, 紧密排列

  <img src="flex & grid Layout.assets/image-20200422161346669.png" alt="image-20200422161346669" style="zoom:33%;" />

#### 2.5 justify-items / align-items / place-items

- justify-items
- align-items

默认  stretch 拉神, 占满整个单元格宽度 / 高度

```css
.wrapper {
    ...
    justify-items: start | end | center | stretch;
    align-items: start | end | center | stretch:
}
/*
	start: 对齐单元格起始边缘
	end: 对齐单元格结束边缘
	center: 单元格内部居中
	stretch: 拉伸, 占满单元格的整个宽度 / 高度
*/
```

e.g.

```css
.wrapper {
    ...
	justify-items: start;
}
```

<img src="flex & grid Layout.assets/image-20200422165608357.png" alt="image-20200422165608357" style="zoom: 50%;" />

e.g.

```css
.wrapper {
	...
	align-items: start
}
```

<img src="flex & grid Layout.assets/image-20200422170030245.png" alt="image-20200422170030245" style="zoom:50%;" />

- place-items 简写形式

  省略第二个值, 视为与第一个值相等

```
.warpper {
	...
	place-items: <align-items> <justify-items>
}
```

#### 2.6 justify-content / align-content / place-content

- justify-content
- align-content

默认 start 对齐容器的起始边框

```css
.wrapper {
	justify-content: start | end | center | stretch | space-around | space-between | space-evenly;
    align-content: start | end | center | stretch | space-around | space-between | space-evenly;
}
```

**justify-content: **

start

<img src="flex & grid Layout.assets/image-20200423142854077.png" alt="image-20200423142854077" style="zoom:50%;" />

end 

<img src="flex & grid Layout.assets/image-20200423142922666.png" alt="image-20200423142922666" style="zoom:50%;" />

center

<img src="flex & grid Layout.assets/image-20200423142941847.png" alt="image-20200423142941847" style="zoom:50%;" />

stretch

<img src="flex & grid Layout.assets/image-20200423143050545.png" alt="image-20200423143050545" style="zoom:50%;" />

space-around

<img src="flex & grid Layout.assets/image-20200423144932818.png" alt="image-20200423144932818" style="zoom:50%;" />

space-between

<img src="flex &amp; grid Layout.assets/image-20200423145001949.png" alt="image-20200423145001949" style="zoom:50%;" />

space-evenly

<img src="flex &amp; grid Layout.assets/image-20200423145024891.png" alt="image-20200423145024891" style="zoom:50%;" />

- place-content

  简写形式, 省略第二个值, 视为与第一个相同

  ```css
  .wrapper {
  	...
  	place-content: <align-content> <justify-content>
  }
  ```

#### 2.7 grid-auto-columns / grid-auto-rows

自动创建的多余单元格列宽 / 行高

默认: 根据内容大小

```css
.wrapper {
    display: grid;
    grid-template-columns: 100px 100px 100px;
    grid-template-rows: 100px 100px 100px;
    /*grid-auto-rows: 100px*/
}
...
.item-8 {
    grid-row-start: 4;
    grid-column-start: 2;
}
.item-9 {
    grid-row-start: 5;
    grid-column-start: 3;
}
```

- 默认, 未设置

<img src="flex & grid Layout.assets/image-20200423154517645.png" alt="image-20200423154517645" style="zoom:50%;" />

- 设置自动行高100px

<img src="flex & grid Layout.assets/image-20200423154632279.png" alt="image-20200423154632279" style="zoom:50%;" />

#### 2.8 grid-template / grid

- grid-template 

  template相关简写

  ```css
  .wrapper {
      ...
      /*具体写法参考示例*/
      grid-template: <grid-template-areas> <grid-template-rows> / <grid-template-columns>
  }
  ```

  e.g.

  ```
  .wrapper {
  	...
  	grid-template: "header header header" 1fr
  				   "main main sidebar" 2fr
  				   "footer footer footer" 1fr /  2fr 1fr 1fr
  }
  ```

  <img src="flex & grid Layout.assets/image-20200423164759061.png" alt="image-20200423164759061" style="zoom:50%;" />

- grid

  显示网格属性 + 隐式网格属性

  ```css
  .wrapper {
  	...
  	/*具体写法参考示例*/
  	grid: <grid-template-rows> <grid-template-columns> <grid-template-areas> <grid-auto-rows> <grid-auto-columns> <grid-auto-flow> <grud>
  }
  ```

  写法一: 行高 / 列宽

  ```css
  grid: <grid-template-rows> / (<grid-template-columns>)
  ```

  e.g.
  
  ```css
  .wrapper {
  	...
  	grid: 1fr 2fr 1fr / repeat(3, 1fr);
  }
  ```
  
  <img src="flex & grid Layout.assets/image-20200426094348754.png" alt="image-20200426094348754" style="zoom:50%;" />

写法二: 行高 / 列宽( 自动先列再行 )

```css
grid: <grid-template-rows> / [auto-flow && dense?] <grid-auto-columns>?
```

e.g.

```css
.wrapper {
    ...
    grid: repeat(4, 1fr) / auto-flow;
}
```

<img src="flex & grid Layout.assets/image-20200426094635530.png" alt="image-20200426094635530" style="zoom:50%;" />

e.g.

```css
.wrapper {
    ...
    grid: 1fr 1fr / auto-flow 50px;
}
```

<img src="flex & grid Layout.assets/image-20200426094841153.png" alt="image-20200426094841153" style="zoom:50%;" />

写法三:  行高( 自动先行再列 ) / 列宽

```css
grid: [auto-flow && dense?] <grid-auto-rows>? / <grid-template-columns>
```

e.g.

```css
.wrapper {
	...
	grid: auto-flow / repeat(4, 1fr)
}
```

<img src="flex & grid Layout.assets/image-20200426100028658.png" alt="image-20200426100028658" style="zoom:50%;" />



### 3 项目属性

#### 3.0 RESUME

- grid-column-start / grid-column-end / grid-row-start / grid-row-end 项目定位 (网格线)
- grid-column / grid-row 项目定位单轴向简写 (网格线)
- grid-area 项目定位双轴向简写 (网格区域, 网格线)
- justify-self / align-self / place-self 单个项目在相应网格区域的对齐方式

#### 3.1 grid-column-start / grid-column-end / grid-row-start / grid-row-end

指定项目的四个边框分别在哪根网格线上 (网格线可用默认数字或名字)

e.g.

```css
.item-1 {
    grid-column-start: 2;
    grid-column-end: 4;
}
```

<img src="flex & grid Layout.assets/image-20200426102004582.png" alt="image-20200426102004582" style="zoom:50%;" />

e.g.

```css
.item-1 {
    grid-column-start: 1;
    grid-column-end: 3;
    grid-row-start: 2;
    grid-row-end: 4;
}
```

<img src="flex & grid Layout.assets/image-20200426102149920.png" alt="image-20200426102149920" style="zoom:50%;" />

- keyword: **span**

跨越网格线数量

e.g.

```css
.item-1 {
    grid-column-start: span 2;
    /*grid-column-end: span2; 效果相同*/
}
```

<img src="flex & grid Layout.assets/image-20200426103553015.png" alt="image-20200426103553015" style="zoom:50%;" />

#### 3.2  grid-column / grid-row

项目定位的简写形式

```css
grid-column: <grid-column-start> / <grid-column-end>
grid-row: <grid-row-start> / <grid-row-end>
```

e.g.

```css
.item-1 {
	grid-column: 1 / 3;
	grid-row: 1 / 3;
}
/*
等价于
.item-1 {
	grid-column: 1 / span 2;  (直接grid-column: span2也可以)
	grid-row: 1 / span 2;
}
*/
```

<img src="flex & grid Layout.assets/image-20200426105251639.png" alt="image-20200426105251639" style="zoom:50%;" />

具体网格线时, 可省略 / 及后面内容, 默认跨1格

e.g.

```css
.item-1 {
    grid-column: 2;
    grid-row: 2;
}
```

<img src="flex & grid Layout.assets/image-20200426105438333.png" alt="image-20200426105438333" style="zoom:50%;" />

#### 3.3  grid-area

值可以是指定的网格区域, 此时需与容器属性grid-template-areas配合使用;

或者也可以是网格线编号

```html
<div class="wrapper">
	<div class="main">main</div>
	<div class="sidebar">sidebar</div>
	<div class="header">header</div>
	<div class="footer">footer</div>
</div>
```

```css
.wrapper {
    ...
    display: grid;
    grid: 1fr 2fr 1fr / repeat(3, 1fr);
    grid-template-areas: "header header header"
        				 "sidebar main main"
        				 "footer footer footer"
        
}
.main {
    grid-area: main;
    background-color: red;
}
...
/*
直接用网格线编号表示
.wrapper {
	...
	display: grid;
	grid: 1fr 2fr 1fr / repeat(3, 1fr)
}
.main {
	grid-area: 2 / 2 / 3 / 4;
	background-color: red;
}
	...
*/
```



<img src="flex & grid Layout.assets/image-20200426112443715.png" alt="image-20200426112443715" style="zoom:50%;" />

#### 3.4 justify-self / align-self / place-self

默认 stretch

- justify-self 水平方向, 单个项目在对应网格区域的对齐方式
- align-self 垂直方向, 单个项目在对应网格区域的对齐方式
- place-self 简写, 省略第二个值, 表示与值一相等

```css
.item {
    justify-self: start | end | center | stretch;
    align-self: start | end | center | stretch;
    place-self: <align-self> <justify-self> 
}
```

e.g.

```css
.item-1 {
    justify-self: start;
}
```

<img src="flex & grid Layout.assets/image-20200426114938457.png" alt="image-20200426114938457" style="zoom:50%;" />