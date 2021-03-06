[View Programming Guide for iOS 原文链接](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009503)

# 介绍
## 关于窗口和视图
在iOS当中，你可以使用窗口和视图来展示你的应用程序的内容到屏幕上。窗口本身没有任何可视化的内容，但它为你的应用程序的视图提供了一个基本的容器。视图可以定义窗口的一部分用来填充你想填充的内容。举例来说，你可以使用视图来展示图片、文字、图形或者任何它们之间的组合。你还可以使用视图来组织管理其它的视图。
### 概览
每款应用程序都至少含有一个窗口和一个视图来展现内容。UIKit和其它的系统框架都提供了定义好的视图让你用来展示你的内容。这些视图从简单的按钮、标签到复杂的视图，比如列表、选择器以及滚动视图应有尽有。若定义好的视图没有提供你想要的功能的话，你还可以定义自定义的视图来管理绘制和事件处理。
#### 视图管理着你的应用程序的可视化界面
视图是UIView类（或其子类）的实例对象，它在你的应用程序的窗口中管理着一个矩形区域。视图负责绘制内容，处理多点触摸事件以及管理子视图的布局。绘制包括使用核心制图、OpenGL ES、或者UIKit等制图技术来在一个视图的矩形区域绘制图形，图片以及文字。一个视图负责在其矩形区域中使用手势或者直接处理触摸事件。在视图层级中，父视图负责对其子视图进行动态的设置位置和大小。这种能够动态的修饰子视图的能力让你的视图能够根据情况进行调整，比如屏幕旋转和动画。  
你可以将视图视作构建你的视图界面的模块。通常使用多个视图来构建视图层级而不是只用一个来展示所有你的内容。每个视图层级中的视图都展示了你的视图界面中的一个特别的部分，它通常已经作为一种特殊类型的内容优化过了。举例来说，UIKit为展示图片，文字和其它类型的内容都有着指定的视图类型。  

```
相关章节：视图和窗口架构，视图
```
#### 窗口协调展示你的视图
窗口是UIWindow类的实例对象，它处理了你的应用程序用户界面的所有展示内容。窗口和视图（以及持有它的视图控制器）一起管理用户交互，响应变更以及视图的可视化层级。大部分情况下，你的窗口不需要做出任何改变。一旦窗口被创建，它将保持不变，只有它所显示的视图才会更改。每个应用程序至少含有一个窗口来展示应用程序的用户界面到设备的主屏幕上。如果有额外的展示设备被连接到设备上，应用程序也可以创建第二个窗口来将内容展示到该屏幕上。

```
相关章节：窗口
```
#### 动画对界面的改变为用户提供了可视化的反馈
动画为用户提供了视图层级变更的可视化反馈。系统为模态化展示视图和一组不同视图之间的转换定义了标准动画。不过，视图的多个属性都能够被直接动画展示。举例来说，通过动画你可以改变一个视图的透明度，它在屏幕上的位置，它的尺寸，它的背景颜色或者其它的属性。若你直接作用于视图底层的核心动画层对象的话，你还可以执行更多的动画。  

```
相关章节：动画
```
#### 界面编辑器的作用
界面编辑器是一款你可以用来生动的构建和配置你的应用程序的窗口和视图的应用程序。使用界面编辑器你能够将你的视图汇集到一起，将其放置在一个nib文件当中，后者是存储你的视图和其它对象的静态版本的一种资源文件。当你在运行时加载一个nib文件的时候，它当中的对象将会重新组合成实际的对象，你的代码就能够以编码的方式对其进行操作了。  
界面编辑器大大简化了你在创建应用程序用户界面时的操作。由于iOS对于界面编辑器和nib文件的支持是贯穿始终的，你在你的应用程序设计期间只需要做很少的工作就能够将nib文件结合进去。  
更多关于如何使用界面编辑器的相关信息参见“界面编辑器用户指南”。关于视图控制器如何管理在nib文件中包含的视图，参见“iOS视图控制器编程指南”中的“创建自定义内容的视图控制器”一节。
### 另请参见
由于视图是很复杂和灵活的一种对象，不可能在一篇文档中涵盖所有它的内容。不过，以下有几篇其它的文档能够帮助你整体学习视图管理和用户界面的其它方面。  

* 视图控制器在管理你的应用程序的视图中是很重要的一部分。视图控制器在单个视图层次结构中主持所有视图并帮助这些视图展示到屏幕上。更多关于视图控制器以及它所扮演的角色，参见“iOS视图控制器编程指南”。
* 在你的应用程序中，视图扮演者手势和触摸事件的关键接受者角色。更多关于适用手势和直接处理触摸事件的相关信息，参见“iOS事件处理指南”。
* 自定义视图必须使用相应的绘图技术来渲染它的内容。更多如何使用这些技术来绘制你自己的视图的相关信息，参见“iOS绘图和印刷指南”。
* 在标准视图动画无法满足需求的地方，你可以使用核心动画。更多关于使用核心动画来实现动画的相关信息，参见“核心动画编程指南”。

# 视图和窗口架构
视图和窗口展示了你的应用程序的用户界面并且处理该用户界面的交互。UIKit以及其他的系统类库提供了大量的视图让你直接或做出很少的修改便能使用。在你需要展现和标准视图不太一样的内容的地方，你还可以定义自己的视图。  
无论你是使用系统的视图或者创建你自己的自定义视图，你都需要理解UIView和UIWindow类提供的基本结构。这些类提供了复杂的工具来管理布局以及视图的展示。了解这些设备的工作方式对于确保您的视图在应用程序中发生更改时具有适当的行为非常重要。
## 视图架构基本原理
大部分你想做的可视化工作都与视图对象有关——它是UIView类的实例对象。视图对象定义了屏幕上的一块矩形区域，它负责处理该矩形区域的绘制和触摸事件。视图还可以做为其他视图的父视图，调整子视图的位置和大小。大部分视图之间的关系UIView类都已经处理好了，不过你也可以根据需要定制默认的行为。  
视图与核心动画层一起负责处理视图内容的渲染和动画。UIKit中的每个视图都是基于一个层对象（通常是CALayer类的实例对象）的，它负责视图的存储，处理视图相关的动画。大部分你需要的操作都可以通过UIView提供的接口来执行。不过，如果你想更好的控制视图的渲染和动画，你可以通过它的layer对象来执行。  
为了更好的理解视图和层的关系，让我们来看一个例子。图1-1展示了视图架构与其底层的核心动画层对象之间的关系（示例来自 ViewTransitions 示例代码）。应用程序中的视图包含一个窗口（也是个视图），一个通用的UIView对象作为容器视图，一个图片视图，一个工具栏来展示按钮，以及一个bar按钮（它本身不是一个视图，但其内部管理者一个视图）。（实际上ViewTransitions 示例代码包含了一个额外的图片视图用来实现转场动画，为了简单起见，也由于该视图通常是隐藏的，就不包含在图1-1中了）每个视图都有一个相关的层对象，可以通过视图的layer属性来进行访问。（由于bar按钮不是一个视图，你不能够直接访问它的层对象。）在这些层对象背后是核心动画负责渲染对象，最后是用于管理屏幕上的实际位的硬件缓冲区。  

图1-1 一个简单应用程序的视图架构  
![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/view-layer-store.jpg)  

核心动画层的使用对于性能有着极为重要的影响。对于一个视图对象的实际绘制的代码要尽可能少的调用，一旦代码被调用，其结果会被核心动画所缓存下来，随后会尽可能的复用。重用已渲染过的内容将减少更新视图时通常需要消耗的代价昂贵的绘图周期。在动画期间重用这些内容尤为重要，在此期间已经存在的内容是能够被改变的。这样重用将会比创建新的内容消耗更少的资源。
### 视图层级和子视图的管理
除了提供它本身的内容之外，一个视图还能够担任其它视图的容器功能。当一个视图包含了另一个视图的时候，一个父子关系就在这两个视图之间形成了。子视图在这个关系中被称作“subview”，父视图被称作“superview”。创建这种类型的关系对应用程序的可视外观和应用程序的行为都有影响。  
在表现上，子视图会遮盖全部或者部分其父视图的内容。若子视图完全不透明，那么被子视图占据的那部分区域会完全阻止了那部分区域的父视图的响应。若子视图是部分透明的，那么在显示到屏幕之前，两个视图的这一部分内容将会融合在一起。每个父视图都以有序的形式存储其子视图，这个顺序也会影响每个子视图的显示。若两个兄弟视图有重叠的部分，那么最后被添加的那个视图（或被移动到子视图数组末尾的那个视图）将会显示在最上层。  
父子视图之间的这个关系同样会影响几个视图的行为。改变父视图的尺寸会引起连锁反应，这将导致它的子视图的大小和位置的改变。当你改变一个父视图的大小时，你可以适时的调整子视图的大小。其它会引起子视图改变的行为包括：隐藏其父视图，改变父视图的alpha值（透明度）或将一个数学上的转换应用到父视图的坐标系当中。  
视图层级当中视图的结构安排同样影响了你的应用程序如何响应事件的行为。当触摸事件发生在一个特定的视图上时，系统会发送一个携带触摸信息的事件对象给那个视图以便其对其做出响应。不过，若该视图不处理这一触摸事件的话，它可以将事件对象传递给其父视图。若父视图也不处理该事件的话，它还可以继续传递给其父视图，以此类推沿着响应链条传递。特定的视图还可以将事件对象传递给一个响应对象中介，比如视图控制器。若没有对象来接收事件的话，最终会抵达应用程序对象，通常会被忽视处理。  
更多关于如何创建视图层级的相关信息，参见“创建和管理一个视图层级”。
### 视图绘制循环
在展现内容的时候，UIView类使用的是一种请求式的绘制模型。当视图第一次呈现在屏幕上时，系统会要求它来绘制内容。然后系统会捕获它的内容的一个截图作为视图的展示内容。若你永远不改变该视图的内容的话，视图的绘制代码将永远不会被再次调用。截图的图片将会在涉及到视图的操作当中被反复使用。若你改变内容，你应当通知系统视图内容发生了变更。视图将会重复绘制视图的过程，然后将捕获新的结果的截图。  
当你的视图内容改变的时候，你不应该直接重新绘制这些变更。你应该使用 setNeedsDisplay 或 setNeedsDisplayInRect: 方法来使这些视图无效。这些方法会通知系统这些视图的内容已经发生了变更，它需要在下一个合适的时机进行重绘。系统将等待到当前运行循环的末尾, 然后再启动任何绘图操作。此延迟使您有机会使多个视图无效、添加或删除层次结构中的视图、隐藏视图、调整视图大小和重新定位视图。所有你做出的改变都会在随后的同一时间同时反映出来。  

```
注意：改变视图的几何形状不会自动触发系统重绘视图内容。视图的 contentMode 属性决定了视图的几何尺寸如何变更才会被解释执行。大部分内容模式会在当前视图的区域内拉伸或重新布局已经存在的截图而不是重新创建一个新的。更多关于内容模式如何影响你的视图绘制过程的相关信息，参见“内容模式”。
```

当渲染你的视图内容的时机到来时，实际上的绘制过程的改变依赖于视图本身和它的配置。系统通常会使用自己的方法来渲染该内容。但系统也暴露了接口让你来配置视图的实际展现形式。对于自定义的UIView的子类而言，你可以通过重写视图的 drawRect: 方法来绘制你的视图的内容。还有很多种其它的方式来提供视图的内容，比如直接设置底层的layer层，但重写 drawRect: 方法是经常使用的一种方式。  
更多关于如何绘制自定义视图内容的相关信息，参见“实现你的绘制代码”。
### 内容模式
每个视图都拥有一个内容模式，它负责控制如何回收视图的内容来响应视图在形状上的变化以及是否回收视图的内容。当视图第一次被展示的时候，它通常会渲染器内容，渲染的结果将会被底层位图所捕获。在这之后，改变视图的结构并不总是引起位图重新创建。属性 contentMode 的值决定了位图是否需要被放大来适应新的大小或者简单的将一个角或一个边固定住。  
当你做以下操作的时候，一个视图的内容模式将会被应用：  

* 改变矩形视图的 frame 或 bounds 属性的宽高。
* 将含有一个放大因素的转换属性赋值给视图的 transform 属性。

默认的，大部分视图的 contentMode 属性被设置为 UIViewContentModeScaleToFill，这将引起视图的内容被放大来适应新的尺寸。图1-2展示了某些可用的视图模式发生时的结果。如你在图中所见，不是所有的内容模式的结果都会在视图的边界内被全部填充，这将可能会扭曲视图内容。  

图1-2 内容模式对比  

![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/scale_aspect.jpg)

内容模式对于回收视图的内容而言是好事，但当你指定你的自定义视图在放大或改变大小等操作时也可以设置内容模式为 UIViewContentModeRedraw。将视图的内容模式设置为该值将强制系统调用视图的 drawRect: 方法来响应形状的变更。通常来讲，你应当尽可能尽量避免使用该值，尤其是在使用标准的系统视图时。  
更多关于内容模式的可用信息，参见“视图类参考文献”。
### 拉伸视图
你可以指定视图的一部分是可拉伸的，当视图的大小改变的时候，只有可拉伸部分的内容才会响应。通常在按钮或其它的定义了可重用区域的视图中应用拉伸模式。你指定的拉伸区域可以允许视图的两个轴方向拉伸。当然，当在两个轴方向拉伸视图的时候，视图的边界必须定义好可重用的部分来避免任何的扭曲。图1-3展示了这种扭曲是如何显示的。视图中带颜色的部分的原始像素被复制, 以填充较大视图中的相应区域。  

图1-3 拉伸一个按钮的背景  

![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/button_scale.jpg)  

你可以使用 contentStretch 属性来指定一个视图的可拉伸区域。该属性接收一个0.0到1.0的矩形值。当拉伸视图的时候，系统将该值域当前视图的大小和放大因素相乘来决定哪个像素或像素点需要被拉伸。该值的应用减少了每次视图尺寸变更的时候都需要更新contentStretch的情况。  
视图的内容模式同样在决定视图的哪部分被拉伸的应用中扮演了角色。拉伸的区域只有在内容模式引起视图的内容被放大的时候才会被应用到。这意味着拉伸视图仅在 UIViewContentModeScaleToFill，UIViewContentModeScaleAspectFit，和 UIViewContentModeScaleAspectFill 等内容模式中才支持。若你指定一个将内容的一个边或一个角固定的内容模式（并没有实际放大内容），视图将忽略拉伸区域。  

	注意：在创建一个可拉伸的UIImage对象来作为指定视图的背景图的时候，推荐使用contentStretch属性。可拉伸视图被核心动画层所管理，通常这将提供更好的性能。

### 内置的动画支持
在每个视图背后都有一个layer对象，它的好处就是你可以很容易的对很多视图相关的变化进行动画展示。动画是一种很有效的和用户互动的方式，在设计你的应用程序期间应当被考虑。很多UIView类的属性都是可以动画的——意思是对于从一个值到另一个值的动画是半自动支持的。要执行一个可动画展示的属性，你只需要做到以下两点：  

1. 告诉UIKit你需要执行一个动画。
2. 改变该属性的值。

UIView当中你可以动画展示的属性如下：  

frame——用它来动画展示视图的位置和大小变更  
bounds——用它来动画展示视图的大小变更  
center——用它来动画展示视图的位置  
transform——用它来旋转或放大视图  
alpha——用它来改变视图的透明度  
backgroundColor——用它来改变视图的背景色  
contentStretch——用它来改变视图的可拉伸区域的变更  

当从一组视图转换到另一组视图的时候，动画效果的应用很重要。通常使用一个视图控制器来管理相关的用户界面上的动画转换。举例来说，对于包含从高层到低层信息的导航界面而言，通常使用导航控制器来管理显示每个相关数据层级的界面转换。不过，你也可以创建两组视图的转换动画来替代视图控制器。在标准的视图控制器动画无法达到你的要求的时候，你就可以这么做。  
除了利用UIKit类来创建动画，你还可以使用核心动画层来创建动画。到了layer层这一级别，你将可以更好的控制你的动画的时机和属性。  
有关如何执行基于视图的动画的详情，参见“动画”一章。有关使用核心动画来创建动画的相关信息，参见“核心动画编程指南”和“核心动画手册”。  
## 视图坐标系统
UIKit中的默认的坐标系统是左上角为坐标原点，然后从坐标原点向下和向右。坐标值使用浮点型，这能够对内容进行复杂的布局和位置计算而不用管底层的屏幕分辨率。图1-4展示了屏幕相关的坐标系统。除了屏幕坐标系统，窗口和视图也定义了它们自己的坐标系统来让你能够设定视图或窗口的坐标（而无需关心屏幕的坐标系统）。  

图1-4 UIKit中的坐标系统方向  

![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/native_coordinate_system.jpg)  

由于每个视图和窗口都定义了它自己的坐标系统，那么你就需要在任何时候都要知道到底是哪个坐标系统在起作用。每当你绘制内容到一个视图，或改变其形状的时候，这都关系到某个坐标系统。在绘制时，你设定的是视图本身的坐标系统。在改变形状时，你设定的是父视图的坐标系统。UIWindow 和 UIView 都包含了方法来帮助你从一个坐标系统转换到另一个。  

> 重要：某些iOS技术定义了与UIKit不同的坐标原点和方向的坐标系统。比如Core Graphics 和 OpenGL ES 使用的是左下角为坐标原点，y轴沿屏幕方向向上的坐标系统。在绘制或创建内容的时候，你写的代码必须考虑到这一点，并应当根据需要对坐标值（或坐标系统的方向）进行调整。

### frame，bounds和center等属性之间的关系
一个视图对象通过使用frame，bounds，和 center等属性来确定其尺寸和位置。  

* frame属性包含frame 矩形区域，它指定了一个视图在其父视图坐标系统中的位置和大小。
* bounds属性包含bounds矩形区域，它指定了一个视图在其本身的坐标系统中的大小（以及其内容的位置）。
* center属性包含了视图中心点，它表示视图在其父视图坐标系统的中心点。

通常使用frame和bounds属性来调整当前视图的几何结构。比如，当你构建视图的层级或者在运行时改变一个视图的尺寸和位置时，你应该使用这些属性。若你只改变视图的位置（而非其尺寸）的话，center属性就可以做到这一点。center属性中的值始终有效，即使是视图的转换中加入了放大或旋转元素。而frame属性中的值在这时就不一定有效了，在视图的转换与转换ID不同的时候，它的值就是无效的。  
通常在绘制的过程中使用bounds属性。bounds矩形区域表示视图在其本身坐标系统中。默认的坐标原点是 (0, 0) ，它的尺寸与frame矩形区域大小相同。任何你在这个区域中绘制的内容都是视图可视化内容的一部分。若你改变了bounds矩形区域的原点的话，任何你绘制在新矩形区域中的内容都会作为视图可视化区域的一部分。  
图1-5 展示了一个image视图的frame 和 bounds之间的关系。在图中，左上角的image视图在其父视图坐标系统中的 (40, 40) 点，尺寸为240乘以380。对于bounds矩形区域，坐标原点为 (0, 0) 矩形区域的大小同样是240乘以380。  

图1-5 视图的frame 和 bounds之间的关系 
![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/frame_bounds_rects.jpg)  

尽管你能够不依赖其他的属性就能够改变frame，bounds，和 center，但改变一个属性将会以以下方式影响其他属性：  

* 当你设置frame属性的时候，bounds属性的值将会等于新frame矩形区域的值。center属性的值同样会改变成新frame矩形区域的中心点的值。
* 当你设置center属性的时候，frame的坐标原点也会响应的做出改变。  
* 当你设置bounds属性的大小，frame属性的大小的值也会被设置为bounds矩形区域的大小。

默认的，一个视图的frame不会被其父视图的frame截去。因此，任何在其父视图frame之外的子视图都会被完全的渲染。不过，你可以通过设置父视图的 clipsToBounds 属性为YES来改变这一行为。不论子视图的是否被截取，触摸事件都会遵守目标视图的父视图的bounds矩形区域。换句话说，若父视图bounds矩形区域之外的部分发生了触摸事件，那么该区域的视图将不会获取到触摸事件。
### 坐标系统的转换
坐标系统转换为快速且简单的改变你的视图（或其内容）提供了一种方式。“仿射变换”是一种数学上的矩阵，它指的是一个坐标点在一个坐标系统中如何映射到另一个不同的坐标系统的一个坐标点上。你可以将仿射变换应用到你的整个视图上，来改变尺寸、位置或者相对于其父视图的方向。您还可以在绘制视图的代码中使用仿射变换来对呈现内容的单个片断执行相同类型的操作。因此你如何应用仿射变换取决于上下文：  

* 若想修改你的整个视图，修改视图的transform属性中的仿射变换。
* 若想修改你的视图中的一部分内容，在drawRect: 方法中修改与当前图形上下文相关的仿射变换。

通常在实现动画的时候，修改一个视图的transform属性。举例来说，你可以使用该属性来创建一个你的视图沿其中心旋转的动画。不要使用该属性来作为你的视图的永久变化，比如修改其在父视图中的位置或尺寸。对于这种变更，你应当修改视图的frame属性。  

> 注意：当改变视图的transform属性时，所有转换都是相对于视图的中心点执行的。

在视图的 drawRect: 方法中，可以将仿射变换应用在你想要绘制的位置和方向上。你无需调整你的视图上的某个对象的位置，只需要简单的为每个对象创建一个相关的调整坐标，通常是（0，0），然后在绘制之前将transform应用在该对象的位置即可。这样做的话，若对象在你的视图当中的位置改变的话，你只需修改transform，这样做比在其位置重新创建对象更快并且消耗更少。你可以使用 CGContextGetCTM 函数来重新获取与图形上下文相关的仿射变换，并且可以使用相关的核心图形层函数在绘制期间来设置或修改它的transform。  
“当前转换矩阵”（CTM）是在任何给定时间使用的仿射变换。当对你的整个视图的图形进行操作时，CTM将会影响存储在视图的transform属性中的值。在drawRect: 方法中，CTM是与当前图形上下文相关的仿射变换。  
每个子视图依据其父视图的坐标系统来构建自己的坐标系统。所以当你修改视图的transform属性时，该属性的变化将会影响视图本身和其所有的子视图。不过，这些变化只影响最终视图渲染到屏幕上的效果。由于每个视图只在其自己的边界内绘制其内容和布局子视图，那么在绘制和布局的时候就可以忽略其父视图的transform。  
图1-6 展示了两种不同的旋转变换在渲染过程中合并后的效果。在视图的 drawRect: 方法中，将一个45度旋转应用在一个图形上将导致该图形旋转45度。将另一个45度旋转应用到视图上将导致图形旋转了90度。图形相对于其视图依旧旋转了45度，但视图的旋转导致它旋转的更多了。  

图1-6 旋转视图和其本身的内容  
![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/xform_rotations.jpg) 

> 重要：若视图的transform属性与转换不统一，那么该视图的frame属性的值是未定义并且必须被忽略的。将一个transform应用在一个视图上时，必须使用视图的bounds 和 center属性来获取该视图的尺寸和位置。其任意子视图的frame依旧有效，因为它们是与视图的bounds相关的。

更多关于在运行时修改视图的transform属性的相关信息，参见“转换、放大和旋转视图”。更多关于如何在绘制期间使用transforms来定位内容的相关信息，参见“iOS绘制和打印指南”。
### 点与像素
iOS 中，所有的坐标值以及距离都使用浮点值以一种叫做points（点）的单位来设定。点的可测量的大小从设备到设备是不同的, 很大程度上无关紧要。对点的理解主要是它们为绘图提供了一个固定的参照框架。  
列表1-1 列出了竖直方向基于iOS设备的不同类型的屏幕尺寸（以点为测量单位）。宽度在前，后面是屏幕的高度。只要您将界面设计成这些屏幕大小, 您的视图就会正确显示在相应类型的设备上。  

列表1-1 基于iOS设备的屏幕尺寸  

设备  | 屏幕尺寸（以点为单位）
------------- | -------------
四英寸高清屏幕的iPhone和iPod touch设备  | 320 x 568
其他iPhone和iPod touch设备  | 320 x 480
iPad  | 768 x 1024

基于点的计量系统被各种类型的设备所使用，被称作“用户坐标空间”。这种标准坐标空间几乎可以在你的代码中的所有位置使用。举例来说，当调整一个视图的几何结构或调用核心绘画函数来绘制视图的内容时，你就可以使用点和用户坐标空间。尽管在用户坐标空间上的坐标有时可以直接映射到设备屏幕的像素点，但你应当不要假设这种情况的存在。而应该记住以下内容：  

*一个点没有必要对应屏幕上的一个像素*  

在设备层面，所有你在视图中设置的坐标都必须被转换为像素。不过，从用户坐标空间的点到设备坐标空间的像素的转换通常被系统处理了。UIKit 和 Core Graphics 底层都使用了基于矢量的绘图模型，在这里所有的坐标值都被使用点来设定。因此，若你使用Core Graphics 来绘制曲线的话，你应当使用相同的值来设置曲线，而无需关心底层屏幕的分辨率。  
当你需要处理图片或其他的基于像素的技术（比如OpenGL ES），iOS将为管理这些像素提供帮助。对于作为资源存储在你的应用程序包当中的静态图片文件，iOS为设置你的图片为不同的像素密度定义了各种转换，也处理了将图片加载为最符合当前屏幕分辨率。视图也为当前的放大因素提供了相关信息，所以你就可以手动调整任何基于像素的绘制代码来适应高分辨率的屏幕。在“iOS绘图和打印指南”一文中的“在视图中支持高分辨率的屏幕”一章中介绍了在不同屏幕分辨率上处理基于像素内容的相关技术内容。
## 运行时视图交互模型
用户与你的界面进行交互时，或你自己编写的代码改变了某些东西时，UIKit中都会发生一系列复杂的事件来处理这些交互。在这一系列事件的某个时间点上，UIKit会调用你的视图类来让它们有机会作为你的应用程序的代表来响应。理解这些调用的时机对于理解你的视图如何与系统共存是非常重要的。图1-7展示了从用户触摸屏幕开始，到图片渲染系统响应更新了屏幕内容为止的一系列事件。对于代码初始化的事件而言，这些事件同样都会发生。  

图1-7 UIKit与你的视图对象进行交互  

![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/drawing_model.jpg)  

以下步骤进一步打乱了图1-7的事件序列，解释了每一步都发生了什么，你的应用程序应该怎么做才能够响应这些事件。  

1. 用户触摸屏幕。
2. 硬件设备将触摸事件报告给UIKit框架。
3. UIKit框架将触摸事件封装为UIEvent对象，并将其分发给对应的视图。（对于UIKit如何将事件发送给你的视图的详细解释，参见“iOS事件处理指南”）
4. 你的视图的事件处理相关的代码要响应事件。比如，你的代码应当：  
	* 改变视图或其子视图的属性（frame, bounds, alpha等等）。
	* 调用 setNeedsLayout 方法来标记该视图（或其子视图）需要更新布局了。
	* 调用 setNeedsDisplay 或 setNeedsDisplayInRect: 方法来标记视图（或其子视图）需要重绘。
	* 通知控制器要改变某些相关的数据。
5. 若一个视图的几何结构由于某些原因发生了改变，UIKit会根据以下规则来更新其子视图：
	* 若你为你的视图配置了自动调整大小的规则，UIKit会为每个视图根据该规则来进行调整。关于自动调整大小的规则如何发挥作用的详细信息，参见“使用自动调整规则来处理布局改变”。
	* 若你的视图实现了 layoutSubviews 方法，UIKit会调用它。你可以在你自己的视图中重写该方法，使用它来调整任何子视图的位置和尺寸。举例来说，一个视图提供了一大块可滚动的区域，它需要使用几个类似“拼图”的子视图来填充，而非一整个大的视图，后者也不适合在内存中进行操作。在该方法的实现中，视图可能会隐藏任何离屏的子视图或调整其位置，使用它们来绘制新的要展示的内容。在这个过程中，视图的布局代码也可以将需要重绘的视图设置为无效的。
6. 对于任何视图的任何被标记为需要重绘的部分，UIKit都会要求该视图重绘其本身。对于定义了 drawRect: 方法的自定义视图，UIKit会调用该方法。你在实现该方法的时候应当除了尽快重绘指定区域的视图之外，什么都不做。不要在这个时间点来做额外的布局变更，也不要在这个时间点改变你的应用程序的数据模型。该方法的目的是更新你的视图的可视化内容。标准的系统视图通常不会实现 drawRect: 方法，但它也是在这个时间点管理其绘制内容的。
7. 任何被更新的视图都是与应用程序其他可视化内容结合在一起发送给渲染硬件来展示的。
8. 渲染硬件将渲染的内容发送给屏幕。

> 注意：前面的更新模型主要适用于使用标准系统视图和绘图技术的应用程序。使用 OpenGL ES 的应用程序通常会配置一个单一的整个屏幕的视图来绘制，并且绘制是与 OpenGL ES 渲染上下文直接相关的。在这种情况下，视图仍旧可能需要处理触摸事件，但由于它是一整个屏幕，它就不需要对子视图进行布局了。更多关于使用 OpenGL ES 的相关信息，参见“OpenGL ES 编程指南”。

在之前的几个处理步骤当中，你的自定义视图的几个关键点是：  

* 事件处理方法：
	* touchesBegan:withEvent:
	* touchesMoved:withEvent:
	* touchesEnded:withEvent:
	* touchesCancelled:withEvent: 
* layoutSubviews 方法
* drawRect: 方法

这几个是最常被重写的方法，不过你无需将其全部重写。若你使用手势来处理触摸事件的话，你就不需要重写任何关于事件处理的方法。同样的，若你的视图不包含任何子视图或其尺寸不会发生变更的话，那么也就无需重写layoutSubviews方法了。最后，drawRect: 方法仅在运行时的视图内容能够改变，并且你在使用本地化的技术（比如UIKit 或 Core Graphics）来绘制内容时才需要进行重写。  
还有很重要的一点就是，这些方法是比较重要的几个节点，但它们不是唯一节点。UIView类还有好几个方法被设计用来让子类重写。你应当查看“UIView类参考文档”的关于方法的描述来看看哪个方法是适合你的自定义实现来重写的。
## 高效使用视图的建议
当系统的视图不能够提供你在绘图时所需要的内容时，这就是自定义视图发挥作用的时候了，但你要负责你的视图的性能要足够好。UIKit为视图相关的内容作了尽可能的优化，它将帮助你来获取你的自定义视图的更好的性能，但你可以在以下方面帮助UIKit来优化。  

> 重要：在优化你的绘制代码之前，你应当获取当前视图的性能相关数据。测量当前性能数据能够让你确定是否真的有问题，如果有的话，你可以在以后的优化当中将其作为起点。

### 视图不总是有相对应的视图控制器
在你的应用程序中单个的视图和视图控制器拥有一对一的关系是很罕见的。视图控制所做的工作是管理视图层级，视图层级通常由超过一个视图所组成，通常会实现自包含功能。对于iPhone应用程序而言，每个视图层级通常会充满整个屏幕，但对于iPad应用程序则是一个视图层级仅充满一部分屏幕。  
在你设计你的应用程序用户界面时，要慎重考虑视图控制器所扮演的角色。视图控制器提供了很多重要的行为，比如调整视图在屏幕上的展示，调整这些视图从屏幕上移除，释放内存以响应低内存警告，旋转视图以响应用户界面的旋转变化。规避这些功能将会引起你的应用程序行为的不正常或没有按照预想的行为表现。  
更多视图控制器的相关信息以及它在应用程序中所扮演的角色，参见“iOS视图控制器编程指南”。
### 最小化自定义绘制
尽管有时候需要绘制自定义内容，但你也应当尽可能避免某些事件。你应当仅在系统的视图无法提供你所需要的外观和功能时才真正需要自定义绘制。只要你的内容能够由已经存在的视图所组合展现，你最好组合这些视图对象为自定义视图层级。
### 利用内容模式
内容模式将重绘你的视图的时间大大缩小了。默认的，视图使用的是 UIViewContentModeScaleToFill 内容模式，它将视图已经存在的内容放大来适应视图的矩形区域。你可以根据你的内容的不同调整视图模式，但应当尽量避免使用 UIViewContentModeRedraw 模式。不管内容模式实际上是什么样，你一直可以通过调用 setNeedsDisplay 或 setNeedsDisplayInRect: 方法来强制你的视图重绘。
### 尽可能将视图声明为不透明的
UIKit为每个视图使用 opaque 属性来决定该视图是否能够被进行混合优化操作。为自定义视图设置该属性的值为YES会告诉UIKit无需对你的视图后的内容进行渲染。更少的渲染能够增加你的绘图代码的性能，当然这也是我们所推荐的。当然，若你将 opaque 属性设置为YES，你的视图必须使用不透明的内容填充其矩形区域。
### 当滚动的时候调整你的视图的绘制行为
滚动会导致短时间内很多视图的更新。若你的视图的绘制代码没有做出适当的调整，那么你的视图在滚动的时候将会非常卡顿。与其试图确保你的视图内容始终是崭新的，你可以考虑在滚动操作开始的时候就改变你的视图的行为。比如，你可以在滚动期间暂时降低渲染内容的质量或改变内容模式。当滚动停止的时候，你可以将视图恢复至之前的状态，然后根据需要更新其内容。
### 不要通过嵌入子视图来进行自定义控制
尽管技术上能够为标准系统控件（继承自UIControl的对象）添加子视图，但你永远都不应该通过这种方式来定制化它们。支持自定义的控件通过控件类本身的显式和已定义好的接口来执行此操作。比如，UIButton类包含了方法来设置按钮的标题和背景图片。使用定义好的这些方法将使你的代码运行良好。若不使用这些方法而是通过嵌入一个自定义的图片或标签到按钮的话，那么在当前或以后按钮的实现发生改变时，你的应用程序的行为可能会不正确。
# 窗口
每款iOS应用程序都至少需要一个窗口——它是UIWindow类的实例对象——有的甚至会包含超过一个窗口。一个窗口对象将会负责以下几方面：  

* 它将包含你的应用程序的可视化内容。
* 在从你的视图到其他应用程序对象之间传递触摸事件扮演关键角色。
* 与你的应用程序的视图控制器一起来调整设备方向的变化。

在iOS当中，窗口不含有标题栏、关闭窗口或任何其他的可视化装饰的。一个窗口永远是一个或多个视图的空白容器。同样的，应用程序不会通过展示新的窗口来改变其内容。当你想要改变展示内容的时候，你应当改变你的窗口最前沿的视图的内容。  
大部分iOS应用程序在其生命周期内都创建并只使用一个窗口。这个窗口会占据设备的整个主屏幕，它在应用程序的生命周期开始时就从应用程序的主nib文件（或通过代码创建）被加载。不过，若一个应用程序支持额外的视频输出展示，它可以创建一个额外的窗口来在那个额外的展示中展示内容。所有其他的窗口通常都是由系统创建，也通常被创建用来响应特殊的事件，比如打入的电话。
## 包含窗口的任务
对于很多应用程序而言，应用程序与窗口进行交互的唯一时机是窗口被创建并启动的时候。不过，你可以使用应用程序的窗口对象来执行一些应用程序相关的任务：  

* 使用窗口对象在窗口的本地坐标系统之间转换点和矩形。举例来说，若你在一个窗口坐标系统中获取到了一个值，你很可能在使用它之前想要将其转换到一个特定的视图坐标系统中。更多如何转换坐标系的相关信息，参见“在视图层级中转换坐标”。
* 使用窗口通知来跟踪窗口相关的改变。在窗口被展示、隐藏、接收或取消的关键点时，窗口会生成通知。你可以使用这些通知来在你的应用程序的其他位置执行操作。更多信息，参见“监控窗口的改变”。

## 创建和配置一个窗口
你可以使用编码或用户界面编辑器的方式来创建和配置你的应用程序的主窗口。不论哪种方式，在启动时创建的窗口都应该持有它并且在你的应用程序代理对象上保存一份引用。若你的应用程序创建了一个额外的窗口，应让应用程序在需要它的时候对其进行懒加载。比如，若你的应用程序支持展示在一块外置的屏幕上显示内容，它应该等到外置显示设备连接上之后它再创建相关的窗口。  
无论你的应用程序是从前台加载还是从后台加载，你应当在启动的时候首先创建主窗口。创建和配置一个主窗口本身不是一个消耗较大的操作。但是, 如果应用程序直接启动到后台, 则应避免使窗口可见, 直到应用程序进入前台。
### 在界面编辑器中创建窗口

### 以编码方式创建窗口
若你倾向于使用编码的方式创建你的应用程序的主窗口，你应当在你的应用程序的代理 application:didFinishLaunchingWithOptions: 方法中包含类似于以下的代码：  

	 self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

这个例子中的 self.window 应当是被假设为声明成你的应用程序代理的属性的，它应当被配置成持有窗口对象。若你为一个额外的显示创建一个窗口，你应当将其赋值给一个不同的变量，并且需要设定非主屏幕 UIScreen 对象的大小来展示该窗口。  
当创建窗口时，你应当始终设置窗口的大小是整个屏幕的大小。而不应该根据状态栏或任何其他的元素来调整窗口的大小。状态栏应始终悬浮于窗口之上，所以你需要做的是将放置在你的窗口中的视图的大小进行调整以适应状态栏。若你使用视图控制器，视图控制器应当自动处理你的视图的大小。
### 添加内容到你的窗口
每个窗口通常都拥有一个根视图对象（被相应的视图控制器所管理）它包含了展示你的内容的所有其他的视图。使用一个根视图简化了更改你的用户界面的过程；若想展示新内容的话，你只需替换根视图即可。若想在你的窗口中初始化一个视图，使用 addSubview: 方法。举例来说，若想初始化一个被视图控制器管理的视图，你应当使用类似以下的代码：  

	[window addSubview:viewController.view];

在这段代码中，你可以选择在你的nib文件中配置窗口的 rootViewController 属性。该属性使用一个nib文件而非编码的方式为配置一个窗口的根视图提供了一种简便的方式。当窗口从它的nib文件加载时该属性被设置了，UIKit会自动的将相关的视图控制器的根视图初始化作为窗口的根视图。该属性只在初始化根视图时使用，不能用于窗口与视图控制器的交互当中。  
你可以将任何视图作为窗口的根视图。根据你的用户界面设计，根视图可以是一个通用的作为一个或多个子视图容器的UIView对象，也能是一个标准的系统视图，或者是一个你定义的自定义视图。一些标准系统视图通常被用作根视图，包括滚动视图，列表视图和图片。  
当配置窗口的根视图时，你要负责设置它在窗口当中的大小和位置。对于不包括状态栏的应用程序或包含一个透明状状态栏的应用程序，要设置视图的尺寸与窗口的尺寸一致。对于展示不透明状态栏的程序，要将你的视图放置在状态栏之下并相应的缩小它的大小。从你的视图的高度中减去状态栏的高度能够避免你的视图的顶部与状态栏展示的时候混合在一起。  

> 注意：若你的窗口的根视图是由一个容器视图控制器（比如页签控制器，导航控制器或分栏视图控制器）所提供，你无需自己初始化该视图的大小。容器视图控制器自动的将其视图的大小根据状态栏的可见与否进行设置。

### 更改窗口的等级
每个UIWindow对象都有一个可配置的 windowLevel 属性，它决定了窗口相对于其他相关窗口的位置。大部分情况下，你都不需要改变应用程序的窗口的等级。新的窗口会在创建的时候自动被赋值为标准窗口等级。标准窗口等级表示该窗口展示的是应用程序相关的内容。更高窗口等级为需要悬浮于应用程序内容之上的信息所保留，比如系统的状态栏或警告信息。虽然你可以将这些等级的窗口自己赋值，但系统通常在你使用特定的界面的时候已经为你做了这些事。比如，当你展示或隐藏状态栏或展示一个警告视图的时候，系统会自动的根据需要创建窗口来展示这些内容。
## 监控窗口的变更
若你想要监控你的应用程序内的窗口的显示和消失，你可以使用以下几个窗口相关的通知做到这一点：  

* UIWindowDidBecomeVisibleNotification
* UIWindowDidBecomeHiddenNotification
* UIWindowDidBecomeKeyNotification
* UIWindowDidResignKeyNotification

这些通知将在你的应用程序的窗口的代码发生改变的时候被发送。因此，当你的应用程序展示或隐藏一个窗口，UIWindowDidBecomeVisibleNotification 和 UIWindowDidBecomeHiddenNotification通知将会相应地被发送。当你的应用程序移到后台执行状态时，这些通知不会被发送。尽管你的窗口在应用程序运行在后台时未显示在屏幕上，但相对于你的应用程序上下文而言，它仍被认为是可见的。  
UIWindowDidBecomeKeyNotification 和 UIWindowDidResignKeyNotification 通知会帮助你的应用程序跟踪哪个窗口是关键窗口——意思是当前的哪个窗口在接收键盘事件以及其他的非触摸相关的事件。尽管当触摸发生的时候触摸事件将会被发送到窗口，但没有相关坐标值的事件将会被发送给你的应用程序的关键窗口。一次只能有一个关键窗口。
## 在外部设备展示内容

### 处理屏幕的连接和断开连接的通知

### 为外部设备配置一个窗口

### 为外部展示配置屏幕模式

# 视图
由于视图对象是你的应用程序与用户进行交互的主要方式，它们会承载着很多的责任。以下是一部分：  

* 布局和子视图管理
	* 视图定义其自己的默认的调整大小的行为以关联其父视图。
	* 视图可以管理一组子视图。
	* 视图可以根据需要重写其子视图的位置和大小。
	* 视图可以从其自身的坐标系统将一个点的坐标转换至其他视图或窗口的坐标系统中。 
* 绘制和动画
	* 视图可以在其矩形区域中绘制内容。
	* 某些视图的属性可以以动画的方式转换至新值。
* 事件处理
	* 视图可以接收触摸事件。
	* 视图可以参与响应者链条。

本章集中讨论创建、管理和绘制视图的步骤以及处理布局和管理视图层级。关于如何在你的视图中处理触摸事件（以及其他事件）的相关信息，参见“iOS事件处理指南”。
## 创建和配置视图对象
你可以使用编码或界面编辑器的方式来创建视图作为自包含的对象，然后将其整合进视图结构来进行使用。
### 使用界面编辑器来创建视图对象

### 编码创建视图对象
若你比较偏向于使用代码的方式创建视图，你可以使用标准的“alloc／init设计模式”来做到这一点。视图的默认的初始化方法是 initWithFrame: 方法，它设置了视图相对于（将要确定的）其父视图的大小和位置的初始值。比如，若你想要创建一个通用的UIView对象，你可以使用类似于以下的代码：  

	CGRect  viewRect = CGRectMake(0, 0, 100, 100);
	UIView* myView = [[UIView alloc] initWithFrame:viewRect];

> 注意：尽管所有的视图都支持 initWithFrame: 方法，某些视图还是有推荐的“初始化方法”能够让你替代使用。更多关于如何自定义初始化方法的相关信息，参见相关类的相关文档。

在你创建一个视图之后，你必须在其可见之前将其添加到一个窗口中（或者其他窗口中的视图）。更多如何添加视图到你的视图层级中的相关信息，参见“添加和移除子视图”。
### 设定一个视图的属性
UIView 类有很多声明的属性来控制视图的显示和行为。这些属性用来控制视图的大小和位置，透明度，背景色以及渲染行为。所有这些属性都有适当的默认值，你可以在随后根据需要进行修改。你还可以从界面编辑器中使用检查窗口来配置更多的属性。  
列表3-1列出了一些比较常用的属性（以及方法）并描述了它的使用。相关的属性都列在一起以便你能够看到如果你想改变视图的某个方面的行为时你能够有哪些选项。  

列表3-1 一些关键视图属性的使用  

属性  | 使用
------------- | -------------
alpha, hidden, opaque  | 这些属性影响一个视图的透明度。alpha 和 hidden属性直接改变视图的透明度。opaque属性告诉系统它是否该合成你的视图。若你的视图的内容完全不透明并将该属性设置为YES，那么将不会暴露任何该视图下的内容。设置该属性为YES能够通过消除不必要的合成操作来提高性能。
bounds, frame, center, transform  | 这些属性影响着视图的尺寸和位置。center 和 frame属性代表视图相对于其父视图的位置。frame还包括了视图的尺寸。bounds属性定义了视图在其自己的坐标系统中的可见区域。transform属性用在以比较复杂的方式动画或移动整个视图的情况中。比如，你可以使用一个transform来旋转或放大一个视图。若当前的transform与transform不一致，那么应当忽略frame属性，因为它是未定义的。更多关于bounds, frame, 和 center属性之间的关系的相关信息，参见“bounds, frame, 和 center属性之间的关系”。更多关于transforms如何影响一个视图的相关信息，参见“坐标系统的转换”。
autoresizingMask, autoresizesSubviews  | 这些属性影响着视图和其子视图的自动调整尺寸的行为。autoresizingMask属性控制着一个视图如何在其父视图的边界内响应变化。autoresizesSubviews属性控制着当前视图的子视图是否应该调整大小。
contentMode, contentStretch, contentScaleFactor | 这些属性影响着视图中的内容的渲染行为。contentMode 和 contentStretch属性决定了在视图的宽或高改变的时候，它的内容会被怎样处理。contentScaleFactor属性只在当你需要定制高分辨率屏幕上的视图的绘制行为时才有用。更多关于内容模式如何影响你的视图的相关信息，参见“内容模式”。更多关于内容拉伸矩形区域的相关信息，参见“可拉伸的视图”。更多关于如何处理放大因素的相关信息，参见“iOS绘制和打印指南”一文的“在视图中支持高分辨率屏幕”一章。
gestureRecognizers, userInteractionEnabled, multipleTouchEnabled, exclusiveTouch | 这些属性影响着你的视图如何处理触摸事件。gestureRecognizers属性包含了依附于视图的手势。其他属性控制了视图支持的触摸事件。更多关于如何在你的视图中响应事件的相关信息，参见“iOS事件处理指南”。
backgroundColor, subviews, drawRect: 方法, layer, (layerClass 方法) | 这些属性和方法帮你管理视图的实际内容。对于简单视图来说，你可以设置其背景色，添加一个或多个子视图。subviews属性包含一组只读的子视图，不过有很多方法来添加和重排子视图。对于自定义绘制行为的视图而言，你必须重写 drawRect: 方法。对于更高级的内容而言，你可以直接操作视图的核心动画层layer。若要指定视图的整个layer层的不同类型，你必须重写layerClass方法。

更多关于所有视图的通用基本属性，参见“UIView类参考文档”。更多关于一个视图的特定属性的相关信息，参见该视图的参考文档。
### 为视图设置将来要使用的标签
UIView类包含了一个tag属性，你可以使用一个整形值来标记一个单个的视图。你可以使用tag来在你的视图层级中标记一个唯一的视图，还可以在运行时对这些视图执行搜索。（基于tag的搜索要比你自己基于视图的循环搜索要快的多）tag属性的默认值是0。  
若要搜索一个标记过的视图，使用UIView的 viewWithTag: 方法。该方法会对接收者及其子视图执行深度优先的搜索。它不会搜索视图层级中的父视图或者其他部分。所以，若从根视图调用该方法会搜索视图层级中的所有视图，但要从一个特定的子视图中调用该方法的话会只搜索一小组视图。
## 创建和管理视图层级
在开发你的应用程序用户界面的过程中，管理视图层级是很重要的一部分。你的视图的结构影响着你的应用程序的可视化界面和如何响应变更和事件。比如，视图层级中的父子关系决定了哪个对象能够处理特定的触摸事件。同样的，父子关系定义了每个视图如何响应屏幕方向的变化。  
图3-1 显示了视图分层如何为应用程序创建所需的视觉效果的示例。在时钟这款应用程序中，视图层级由来自不同资源的混合视图所组成。页签栏和导航视图是特殊的视图层级，它们由页签和导航控制器对象来管理整个用户界面的一部分。在两个栏之间的其余部分属于时钟应用程序的自定义视图层级。  

图3-1 时钟应用程序的视图层  

![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/windowlayers.jpg)

在iOS应用程序中有几种方法来构建视图层级，包括在界面编辑器中显示的编辑和使用代码编程。以下章节为你展示了如何构建你的视图层级以及在构建之后如何在视图层级中查找视图和在不同的视图坐标系统之间转换。
### 添加和移除子视图
在构建视图结构的时候，界面编辑器是一种非常方便的方式，因为它能够让你直观的排列你的视图，知晓视图之间的关系以及能够知道在运行时这些视图是如何展现的。当使用界面编辑器的时候，最终的视图结构是保存在一个nib文件中的，它将在运行时根据需要加载相应的视图。  
若你更倾向于使用代码的方式创建视图，你可以使用以下的方法来创建和初始化以及排序：  

* 若要添加一个视子视图到其父视图上，调用父视图的 addSubview: 方法。该方法会将子视图添加到父视图的子视图列表的末尾。
* 若要将一个子视图插入到其父视图的子视图列表当中的中间位置，调用父视图的insertSubview:...方法。将一个子视图插入到列表的一个可视化位置，该视图会在列表中任何将要显示的视图之后。
* 若要重排父视图的子视图的顺序，调用父视图的 bringSubviewToFront:, sendSubviewToBack:, 或 exchangeSubviewAtIndex:withSubviewAtIndex: 等方法。使用这些方法比将视图移除或重新插入视图要快得多。
* 若要将一个子视图从其父视图移除，调用子视图（而非父视图）的 removeFromSuperview 方法。

当将一个子视图添加到其父视图上时，子视图当前的frame矩形区域表示它在父视图中的初始化位置。在父视图外部的子视图的区域默认是不会被剪切掉的。如果你想要剪切掉父视图区域之外的子视图的内容，你必须设置父视图的 clipsToBounds 属性为YES。  
你可以在视图控制器的 loadView 或 viewDidLoad 方法中添加一个视图到视图层级中。若你使用代码的方式构建你的视图，你可以将创建视图的代码放置在视图控制器的loadView方法中。不论你是用代码还是用界面编辑器的方法加载视图，你都可以将视图的配置相关的额外代码放在viewDidLoad方法中。  
清单3-1展示了“UIKit Catalog (iOS): Creating and Customizing UIKit Controls”示例工程的TransitionsViewController类的viewDidLoad方法。TransitionsViewController类管理着相关的两个视图之间的转场动画。应用程序的初始化视图层级（由一个根视图和一个工具栏组成）是从一个nib文件中加载的。viewDidLoad方法中的代码随后创建了容器视图和图片视图用来管理转场。容器视图的目的是为了简化实现两个图片视图之间转场动画的代码。容器视图本身没有实际的内容。  

清单3-1 添加视图到一个已经存在的视图层级中  

	- (void)viewDidLoad
	{
	    [super viewDidLoad];
	 
	    self.title = NSLocalizedString(@"TransitionsTitle", @"");
	 
	    // create the container view which we will use for transition animation (centered horizontally)
	    CGRect frame = CGRectMake(round((self.view.bounds.size.width - kImageWidth) / 2.0),
	                                                        kTopPlacement, kImageWidth, kImageHeight);
	    self.containerView = [[[UIView alloc] initWithFrame:frame] autorelease];
	    [self.view addSubview:self.containerView];
	 
	    // The container view can represent the images for accessibility.
	    [self.containerView setIsAccessibilityElement:YES];
	    [self.containerView setAccessibilityLabel:NSLocalizedString(@"ImagesTitle", @"")];
	 
	    // create the initial image view
	    frame = CGRectMake(0.0, 0.0, kImageWidth, kImageHeight);
	    self.mainView = [[[UIImageView alloc] initWithFrame:frame] autorelease];
	    self.mainView.image = [UIImage imageNamed:@"scene1.jpg"];
	    [self.containerView addSubview:self.mainView];
	 
	    // create the alternate image view (to transition between)
	    CGRect imageFrame = CGRectMake(0.0, 0.0, kImageWidth, kImageHeight);
	    self.flipToView = [[[UIImageView alloc] initWithFrame:imageFrame] autorelease];
	    self.flipToView.image = [UIImage imageNamed:@"scene2.jpg"];
	}

> 重要：父视图自动持有它们的子视图，所有将一个子视图嵌入到一个父视图之后释放它是安全的。事实上，我们推荐你这么做，因为它避免了你一次性持有过多视图而导致的应用程序内存泄漏。不过要记住，若你将一个子视图从其父视图中移除然后打算重用的话，你必须再次持有该子视图。removeFromSuperview方法在将一个视图从其父视图上移除之前会自动的释放该视图。若你在下一个事件循环之前没有持有视图的话，视图将会被释放。  
> 更多关于Cocoa内存管理惯例的相关信息，参见“高级内存管理编程指南”。

当你将一个视图添加到另一个视图时，UIKit会同时通知父视图和子视图事件的变更。若你实现自定义视图的话，你可以通过重写一个或多个 willMoveToSuperview:, willMoveToWindow:, willRemoveSubview:, didAddSubview:, didMoveToSuperview, 或 didMoveToWindow 方法来截获这些通知。你也可以通过这些通知来更新任何与你的视图层级相关的状态信息或执行一些额外的工作。  
在创建一个视图层级之后，你可以通过使用视图的 superview 和 subviews 属性来操纵它。每个视图所包含的window 属性包含了视图当前展示（若有的话）的窗口。由于一个视图层级的根视图没有父视图，它的superview属性被设置为nil。对于当前屏幕上的视图，窗口对象是视图层级的根视图。
### 隐藏视图
若要隐藏一个可视化视图，你可以设置它的 hidden 属性为YES或者改变它的alpha为0.0。一个隐藏的视图是不会从系统接收触摸事件的。不过，隐藏的视图会参与自动调整大小和其他的与视图层级相关的布局操作。因此，从视图层级中隐藏一个视图通常作为移除视图的替代方法，尤其是你想要在随后的某个时间点再展示该视图。  

> 重要：若你隐藏的视图是当前的第一响应者，视图不会自动的消除它的第一响应者状态。事件还是会第一时间传递到隐藏视图。若要阻止这种事件的发生，你应当在隐藏视图的时候强制你的视图消除第一响应状态。更多关于响应链条的相关信息，参见“iOS事件处理指南”。

若你想要以动画的方式展示一个视图从隐藏到展示（或者反过来），你必须使用视图的alpha属性。hidden属性不是能够通过动画展示的属性，所以你做的任何改变都是立即生效的。
### 在视图层级中定位视图
有两种方式在一个视图层级中定位一个视图：   

* 在合适的位置保存指向相关的视图的指针，比如在视图控制器中持有的视图。
* 为每个视图的 tag 属性赋值一个唯一的整形值然后使用 viewWithTag: 方法来定位它。

保存相关视图的引用是定位视图最常用的做法，它使得访问这些视图非常方便。若你使用界面编辑器来创建你的视图，你可以在nib文件中使用 outlets 来连接视图对象（包含表示管理控制器对象的文件拥有对象）。对于代码创建的对象，你可以存储这些视图的引用为私有成员变量。无论你使用outlets或是私有成员变量，你都要负责根据需要持有这些视图并释放它们。最好的持有对象和释放对象的方法是使用声明属性。  
标签是一种减少硬编码依赖和支持更动态和灵活的解决方案。比起存储一个视图的指针，你可以使用标签来定位它。标签还是一种引用视图更持久的方式。比如，若你想要存储当前应用程序中可见区域的一组视图，你可以将每个可见视图的标签写入一个文件中。这比归档实际的视图对象要简单很多，尤其是在当你只需要跟踪到底是哪些视图是当前正在显示的情况下。当你的应用程序在随后加载的时候，你可以使用这些标签来重新创建你的视图，然后使用存储的标签列表来为每个视图设置可见性，从而能够将你的视图层级返回到之前的状态。
### 转场，放大和旋转视图
每个视图都有一个相关联的仿射变换，你可以用它来过渡、放大或旋转视图的内容。视图的转换改变了视图最终的渲染效果，这通常用来实现滚动、动画或其他的视觉效果。  
UIView的 transform属性包含了一个能够转换的 CGAffineTransform 结构体来应用。默认的，该属性被设置为相同转换，所以不会修改视图的显示。你可以在任何时候给这个属性赋值一个新的转换。比如，要旋转一个视图45度，你可以使用以下代码：  

	// M_PI/4.0 is one quarter of a half circle, or 45 degrees.
	CGAffineTransform xform = CGAffineTransformMakeRotation(M_PI/4.0);
	self.view.transform = xform;

将以上转换代码应用于一个视图会让该视图沿中心点顺时针方向旋转。图3-2展示了一个嵌入应用程序的图片视图应用该转换的效果。  

图3-2 旋转一个视图45度  

![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/rotated_view.jpg)  

当应用多个转换到一个视图上时，要注意你添加到CGAffineTransform结构上的转换的顺序。旋转视图然后转换于先转换然后旋转它是不一样的。即使这两种情况下的旋转和转换的数量是一样的，转换的顺序影响着最终的结果。此外，任何你添加并应用到视图上的转换都与视图的中心点相关。因此，应用一个旋转因素来旋转视图是围绕其中心点旋转。放大一个视图会改变视图的宽高，但不会改变其中心点。  
更多关于创建和使用转换的相关信息，参见“Quartz 2D编程指南”中的“转换”一章。
### 在视图层级中转换坐标
在很多情况下，尤其是处理事件时，应用程序都会需要从一个坐标系转换坐标到另一个。比如，触摸事件会通知窗口触摸在窗口中的位置，但是视图对象通常需要知道它在视图坐标系统中的位置信息。UIView 类定义了以下方法来从视图的坐标系统中转入或转出坐标值。  
	convertPoint:fromView:  
	convertRect:fromView:  
	convertPoint:toView:  
	convertRect:toView:  
convert...:fromView:方法会从其他的视图坐标系统中转换坐标到当前视图的坐标系统中（矩形边界内）。相反的，convert...:toView:会从当前视图坐标系统（矩形边界内）转换坐标到指定视图的坐标系统中。若你在这些方法中的视图引用处传nil，转换会存在于包含视图的窗口的坐标系统与视图之间。  
除了UIView的转换方法，UIWindow 类也定义了一些转换方法。这些方法与UIView的版本相似，不过它们是在窗口的坐标系统之间进行转换的。  
convertPoint:fromWindow:  
convertRect:fromWindow:  
convertPoint:toWindow:  
convertRect:toWindow:  
在旋转视图中转换坐标时, UIKit 将在假定返回的矩形要反映原矩形所覆盖的屏幕区域的假设下转换矩形。图3-3展示了在转换期间旋转是如何引起矩形大小变换的一个例子。图中外部的父视图包含了一个旋转的子视图。从子视图的坐标系统转换一个矩形到父视图的坐标系统会产生一个较大区域的矩形区域。这个较大的矩形实际上是 outerView 边界中的最小矩形, 它完全包围了旋转的矩形。  

图3-3 在一个旋转的视图中转换坐标  

![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/uiview_convert_rotated.jpg)  

## 在运行时调整视图的大小和位置
无论何时视图的尺寸变更了，它的子视图的位置和尺寸都必须随着变更。UIView 类支持在一个视图层级中自动和手动布局视图。若通过自动布局，你需要为每个视图设置规则以适应其父视图的尺寸变更，然后就无需再进行尺寸变更的调整操作了。若通过手动布局，你要根据需要对视图的位置和尺寸进行手动调整。  
### 为布局的变更做好准备
视图中发生以下任何事件都会引起布局的变更：  

* 视图的矩形区域大小改变。
* 用户界面方向发生改变，这通常会触发根视图的矩形区域大小改变。
* 有关视图层的一系列核心动画层发生改变，需要布局。
* 你的应用程序通过调用视图的 setNeedsLayout 或 layoutIfNeeded 方法强制布局。
* 你的应用程序通过调用视图底层的layer对象的 setNeedsLayout 方法强制布局。

### 使用自动布局的规则来自动的处理布局的变更
当你改变一个视图的尺寸时，嵌入其中的任何子视图的位置和大小通常都需要改变，以适应其新的父视图的大小。父视图的 autoresizesSubviews 属性决定了子视图是否需要重新调整大小。若该属性被设置为YES，视图会利用每个子视图的 autoresizingMask 属性来决定如何调整该子视图的位置和大小。任何子视图的大小的变化都会引起类似的嵌入它们当中的子视图的布局调整。  
对于在你的视图层级中的每个视图而言，为视图的 autoresizingMask 属性设置一个适当的值是处理自动布局变化很重要的一部分。列表3-2 列出了你可以应用在视图上的自动调整选项，并描述了在布局期间它们的作用。你可以通过使用或运算符将这些常量连在一起或者直接将这些常量相加然后赋值给 autoresizingMask 属性。若你使用界面编辑器来对你的视图进行布局的话，你可以使用自动调整检查器来设置这些属性。  

列表3-2 自动调整相关常量  

自动调整常量  | 描述
------------- | -------------
UIViewAutoresizingNone  | 视图不会自动调整大小（默认为该值）。
UIViewAutoresizingFlexibleHeight  | 当父视图的高改变后，视图的高度随着改变。若不包含该常量的话，视图的高度不会改变。
UIViewAutoresizingFlexibleWidth  | 当父视图的宽改变后，视图的宽度随着改变。若不包含该常量的话，视图的宽度不会改变。
UIViewAutoresizingFlexibleLeftMargin  | 子视图的左边与父视图的左边之间的距离会根据需要增加或减少。若不包含该常量，子视图的左边与父视图的左边为固定距离。
UIViewAutoresizingFlexibleRightMargin  | 子视图的右边与父视图的右边之间的距离会根据需要增加或减少。若不包含该常量，子视图的右边与父视图的右边为固定距离。 
UIViewAutoresizingFlexibleBottomMargin  | 子视图的底部与父视图的底部之间的距离会根据需要增加或减少。若不包含该常量，子视图的底部与父视图的底部为固定距离。
UIViewAutoresizingFlexibleTopMargin  | 子视图的顶部与父视图的顶部之间的距离会根据需要增加或减少。若不包含该常量，子视图的顶部与父视图的顶部为固定距离。

图3-4 展示了这些选项应用在一个视图上的效果。出现的给定的常量表示当父视图的大小发生改变的时候，在该方面的视图布局是灵活的。未出现的常量表示该视图在该方面是固定布局的。当你在单个坐标轴上配置具有多个可变属性的视图时, UIKit 会在相应的空格间均匀分布任何大小的更改。    

图3-4 视图自动调整常量  

![](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Art/uiview_autoresize.jpg)  

最简单的配置自动调整的规则的方法是使用界面编辑器的尺寸检查器中的自动调整控件。上图中灵活的宽高常量属性与尺寸检查器中的自动调整控件效果相同。不过，使用边距检查器的效果是相反的。在界面编辑器中，出现的边距检查器表示有固定的大小，而未出现的表示边距是灵活的。幸运的是，界面编辑器提供了一个动画来为你展示自动调整行为是如何影响你的视图的。  

> 重要：若视图的 transform 属性不包含目标transform的话，该视图的尺寸是未定义的，自动调整布局的结果也同样未定义。

在自动调整布局的规则作用在所有视图之后，UIKit会给每个视图一次机会来对其父视图进行必要的调整。更多关于如何手动管理视图的布局，参见“手动对你的视图布局进行调整”一节。
### 手动对你的视图布局进行调整
无论何时，一个视图的大小改变了，UIKit都会将自动调整大小的行为应用于该视图的子视图，然后调用该视图的 layoutSubviews 方法来让它进行手动布局。在自定义视图中，在自动调整行为无法达到你的预期效果的时候你可以通过重写该方法来实现。你重写该方法可以做以下内容：  

* 直接调整任何子视图的尺寸和位置。
* 添加或删除子视图或核心动画层。
* 通过调用子视图的setNeedsDisplay 或 setNeedsDisplayInRect:方法来强制其进行重新绘制。

通常在实现一个较大的可滚动区域的时候应用程序会对子视图进行手动布局。因为通过唯一一块视图来实现可滚动区域不实际，应用程序通常会实现一个根视图，它包含着一定数量的子视图块。每块子视图都代表着可滚动区域的一部分。当滚动事件发生的时候，根视图会调用 setNeedsLayout 方法来初始化布局变更。它的layoutSubviews 方法随后会基于滚动发生的视图块来调整位置。当子视图块滚动出视图的可视化区域时， layoutSubviews 方法将视图块移动到即将显示的边界，在这个过程中替换它的内容。  
当编写你的布局代码时，要确保以以下方式来测试你的代码：  

* 改变你的视图的方向来确保所有支持的设备方向上你的视图的布局都是正确的。
* 确保你的代码能够正确响应顶部状态栏的高度变更。当接入电话时，状态栏会高度增加，当挂掉电话时，状态栏会高度减少。

关于自动调整布局行为如何影响着你的视图的尺寸和大小的相关信息，参见“使用自动布局的规则来自动的处理布局的变更”一节。关于如何实现视图块的例子，参见“ScrollViewSuite”示例工程。
## 在运行时修改视图
当应用程序接收到用户的输入时，它们会调整用户界面来响应那些输入。应用程序可能通过重新排列、改变位置和大小、隐藏或展示来改变它的视图，或者直接加载一套新的视图。在iOS应用程序中，有一些位置和方法来让你执行这些操作：  

* 在视图控制器中：
	* 视图控制器在展现视图之前必须要创建它们。可以通过nib文件，也可以通过代码的方式加载创建它们。当这些视图不再被需要的时候，应该处理掉它们。
	* 当一个设备的方向发生变更的时候，视图控制器可能需要调整视图的大小和位置来匹配。作为调整新的方向的一部分，可能需要隐藏或显示一些视图。
	* 当一个视图控制器管理着可编辑的内容，它可能需要调整它的视图层级在编辑和非编辑模式之间进行转换。比如，可能需要添加一个额外的按钮或控件来帮助编辑各种不同方面的内容。还可能需要调整任何已经存在的视图来适应额外的控件。
* 在动画块中：
	* 当你想要在界面中从不同组视图之间进行转换的话，你需要在一个动画块当中隐藏或展现某些视图。
	* 当实现特殊效果的时候，你可能需要一个动画块来修改视图的各种属性。比如，若想动画展示一个视图的尺寸的变化，你应当修改视图它的矩形区域的大小。
* 其他途径：
	* 当触摸事件或手势发生的时候，你的界面可能需要通过加载一组新的视图或改变当前视图来响应。更多关于处理事件的相关信息，参见“iOS事件处理指南”。
	* 当用户与一个滚动视图交互的时候，一大片可滚动的区域可能会隐藏或展示部分子视图。更多关于支持可滚动内容的相关信息，参见“iOS滚动视图编程指南”。
	* 当键盘出现的时候，你可能需要重新调整视图的位置和大小以便它们不被键盘所遮挡。更多关于如何与键盘进行交互的相关信息，参见“iOS文本编程指南”。

视图控制器是一个初始化改变视图的常用的地方。因为视图控制器管理着与当前展示内容相关的视图层级，它会最终负责这些视图所发生的事情。当加载这些视图或处理设备方向变更的时候，视图控制器可以添加新视图，隐藏或替换已经存在的视图，还可以操作任意数量的视图准备显示。若你的视图支持编辑内容，UIViewController的 setEditing:animated:方法是一个你切换编辑状态的地方。  
动画块是另一个初始化视图相关变化的地方。UIView 类内置了动画，它可以很方便的动画展示视图的属性变更。你还可以使用 transitionWithView:duration:options:animations:completion: 或 transitionFromView:toView:duration:options:completion: 方法来交换整套视图。
关于视图动画和初始化视图转换的相关信息，参见“动画”一节。关于如何使用视图控制器来管理视图相关的行为，参见“iOS视图控制器编程指南”。
## 与核心动画层的交互
每个视图对象都有一个专有的核心动画层，它管理着视图在屏幕上的展现和动画。尽管你也能够通过视图来做很多事情，但你也可以通过直接操作相关层对象达到目的。视图的层对象存储在视图的layer属性中。
### 改变一个视图的层级类
在视图被创建之后，与视图相关的layer层的类型就不能被改变了。所以每个视图都使用 layerClass 类方法来指定layer对象的类。该方法默认会返回 CALayer 类，唯一能改变该值的方法是继承它，重写该方法，然后返回一个不同的值。你可以使用一个不同类型的layer来改变它的值。比如，若你的视图用来展示一大块可滚动的区域，你可能需要使用 CATiledLayer 类来作为你的视图的背景。  
实现layerClass方法只需要简单的创建指定的Class对象然后返回它即可。比如，一个滚动视图可能需要这样实现该方法：  

	+ (Class)layerClass
	{
   		 return [CATiledLayer class];
	}

每个视图都会在初始化的过程中调用它的layerClass方法，使用它所返回的类来创建layer对象。此外，视图通常会将其本身作为它的layer对象的代理对象。在这一点上，视图拥有它的layer并且视图与layer之间的关系不能改变。你不能够将相同的视图赋值给其他的layer对象作为其代理对象。改变视图的拥有关系或代理关系可能会引起绘图相关的问题，也可能会造成你的应用程序的潜在的崩溃。
更多关于核心动画层所提供的不同类型的layer对象的相关信息，参见“核心动画文档集合”。
### 在一个视图中嵌入层级对象
若你更倾向于操作layer对象而非视图的话，你可以根据需要将自定义的layer对象包含进你的视图层级中。一个自定义的layer对象是CALayer类的实例对象，它不被视图所拥有。通常使用编码的方式创建自定义的layer并使用核心动画层来嵌入它们。自定义layer对象不接收事件，并且不参与响应链条，但它会绘制其本身以及响应父视图的尺寸变更或根据核心动画层的规则的变更。  
清单3-2展示了一个视图控制器的viewDidLoad方法的例子，在其中创建了一个自定义的layer对象，并将其添加到根视图上。layer被用来展示一个动画展示过的静态图。你应当将layer添加到视图的底层layer上，而非添加到视图上。  

清单3-2 添加一个自定义layer到视图上  

	- (void)viewDidLoad {
	    [super viewDidLoad];
	 
	    // Create the layer.
	    CALayer* myLayer = [[CALayer alloc] init];
	 
	    // Set the contents of the layer to a fixed image. And set
	    // the size of the layer to match the image size.
	    UIImage layerContents = [[UIImage imageNamed:@"myImage"] retain];
	    CGSize imageSize = layerContents.size;
	 
	    myLayer.bounds = CGRectMake(0, 0, imageSize.width, imageSize.height);
	    myLayer = layerContents.CGImage;
	 
	    // Add the layer to the view.
	    CALayer*    viewLayer = self.view.layer;
	    [viewLayer addSublayer:myLayer];
	 
	    // Center the layer in the view.
	    CGRect        viewBounds = backingView.bounds;
	    myLayer.position = CGPointMake(CGRectGetMidX(viewBounds), CGRectGetMidY(viewBounds));
	 
	    // Release the layer, since it is retained by the view's layer
	    [myLayer release];
	}

你可以根据需要添加任意数量的子layer并将其整合到子layer层级中。不过，在某一时刻，这些layer必须依附于视图的layer对象。  
更多关于如何直接操作layer的相关信息，参见“核心动画编程指南”。
## 声明一个自定义视图
若标准的系统视图不能够提供你所需要的，你可以定义一个自定义视图。自定义视图会给予你对于应用程序内容展现的完全控制权，与内容之间的交互也由你控制。  

> 注意：若你使用 OpenGL ES 来绘制，你应当使用 GLKView 类，而不是通过继承UIView类。更多使用 OpenGL ES绘制的相关信息，参见“OpenGL ES编程指南”。

### 实现一个自定义视图的检查表
自定义视图所要做的工作是展现其内容并管理该内容的交互。成功实现一个自定义视图不止包括绘制和处理事件。以下检查表包括了很多在实现自定义视图时你能够重写（或你能够提供的行为）的重要的方法。  

* 为你的视图定义合适的初始化方法：  
	* 对于你想要通过代码创建的视图，重写 initWithFrame:方法或定义一个自定义的初始化方法。
	* 对于你想要从nib文件中加载的视图，重写 initWithCoder: 方法。使用该方法来初始化你的视图然后将其放入已知状态。
* 实现dealloc方法来处理自定义数据的清理工作。
* 要处理任何自定义绘制相关内容，重写 drawRect: 方法，在此编写绘制代码。
* 为视图的 autoresizingMask 属性进行设置，定义其自动调整尺寸的行为。
* 若你的视图类管理着一个或多个整块的子视图，需要做以下事情：
	* 在你的视图初始化期间创建这些子视图。
	* 创建时为每个子视图设置 autoresizingMask 属性。
	* 若你的子视图需要自定义布局，重写 layoutSubviews 方法，在此实现布局代码。
* 若要处理触摸相关事件，需要做以下事情：
	* 通过使用 addGestureRecognizer: 方法来为视图添加任何适合的手势。
	* 对于你想要自行处理触摸事件的情况，重写 touchesBegan:withEvent:, touchesMoved:withEvent:, touchesEnded:withEvent:, 和 touchesCancelled:withEvent: 等方法。（不论你重写了哪个相关的触摸事件方法，你都要重写 touchesCancelled:withEvent: 方法。）
* 若你想打印出来的视图与屏幕上的版本看上去不一样的话，你要实现 drawRect:forViewPrintFormatter: 方法。对于如何支持视图的打印功能的详细信息，参见“iOS绘制和打印指南”。

除了重写方法之外，记住视图本身还有很多已经存在的属性和方法。比如 contentMode 和 contentStretch属性能够让你改变视图最终渲染的样子，这也许比你自己重新绘制更好。除了 UIView 类本身，视图底层的CALayer还有很多方面让你能够直接或间接的配置视图。你甚至可以改变layer对象的类。  
更多关于视图类的属性和方法的相关信息，参见“UIView类参考”。
### 初始化你的自定义视图
每个你定义的新的视图对象都应该包含一个自定义的initWithFrame:初始化方法。该方法负责在类创建的时候初始化并将视图对象置于已知状态。当用代码创建视图的时候，你可以使用该方法来创建视图的实例对象。  
清单3-3展示了一个实现initWithFrame:方法的标准框架。该方法会先调用父类的实现，然后在返回初始化后的对象之前进行类的实例变量和状态信息的初始化。习惯上会先调用父类的实现，如果有问题的话，你可以终止执行你的初始化代码然后返回nil。  

清单3-3 初始化一个视图的子类  

	- (id)initWithFrame:(CGRect)aRect {
	    self = [super initWithFrame:aRect];
	    if (self) {
	          // setup the initial properties of the view
	          ...
	       }
	    return self;
	}

若你打算通过一个nib文件来加载自定义视图的实例对象，你应该知道在iOS当中，通过nib文件加载的代码不会使用initWithFrame:方法来初始化新的视图对象。它使用的是 initWithCoder: 方法，该方法是NSCoding协议的一部分。  
即使你的视图遵守了NSCoding协议，界面编辑器也不知道你的视图的自定义属性，所以不会将这些属性编码到nib文件中。所以你的initWithCoder: 方法必须执行初始化的代码使视图处于已知状态。你还可以在你的视图中实现 awakeFromNib 方法，用它来执行额外的初始化。
### 实现你的绘制代码
对于需要自定义绘制的视图你需要重写 drawRect: 方法，将绘制代码写在这里。自定义绘制是最不推荐的一种做法。通常推荐使用其它类型的视图来展示内容。  
实现 drawRect: 方法应当只做一件事：绘制你的内容。该方法不应用来更新应用程序的数据结构或执行其它与绘制无关的任务。它应当配置绘制环境，绘制视图内容，然后尽快退出。若你的 drawRect: 方法可能被频繁调用的话，你应当尽可能优化你的绘制代码并在该方法每次被调用的时候尽可能少的绘制内容。  
在调用你的视图的 drawRect: 方法之前，UIKit会为你的视图配置基本的绘图环境。尤其是它创建了一个绘图的上下文环境，然后将它的坐标系统进行裁剪调整以匹配视图的可见区域的坐标系统。因此，当你的 drawRect:方法被调用的时候，你可以使用现成的类似UIKit 和 Core Graphics等技术来开始绘制你的内容。你可以使用 UIGraphicsGetCurrentContext 函数来获取一个指向当前绘制内容的指针。  

> 重要：当前绘制上下文仅当 drawRect: 方法被调用期间才有效。UIKit可能会为每个随后的调用该方法的过程创建不同的绘制上下文，所以你不应该去试图缓存对象并在随后使用它。

清单3-4 展示了一个drawRect: 方法的实现示例，它为一个视图绘制了一个10像素宽的红色边框。因为UIKit为它低层的实现绘制操作使用了Core Graphics，你可以结合绘制的调用，就像展示的这样，来得到你所要的结果。  

清单3-4 绘制方法  

	- (void)drawRect:(CGRect)rect {
	    CGContextRef context = UIGraphicsGetCurrentContext();
	    CGRect    myFrame = self.bounds;
	 
	    // Set the line width to 10 and inset the rectangle by
	    // 5 pixels on all sides to compensate for the wider line.
	    CGContextSetLineWidth(context, 10);
	    CGRectInset(myFrame, 5, 5);
	 
	    [[UIColor redColor] set];
	    UIRectFrame(myFrame);
	}

若你知道你的视图的绘制代码一直会以不透明的方式覆盖视图的整个区域的话，你可以通过设置你的视图的 opaque 属性为YES来提高性能。当你标记一个视图为不透明时，UIKit会立刻停止绘制处于你的视图背后的视图。不过，你应当仅在知道你的视图内容为不透明时才将此属性设置为YES。若你的视图不能保证它的内容始终为不透明的话，你应当设置该属性为NO。  
另一个提高绘制性能的方法（尤其是在滚动期间）是设置你的视图的 clearsContextBeforeDrawing 属性为NO。当该属性被设置为YES时，UIKIt 会在你的 drawRect: 方法调用之前使用透明黑色的方法来更新区域来自动填充。设置该属性为NO为该填充操作降低了开销，但会使应用程序来负担填满传递给您的 drawRect: 的更新矩形带有内容的方法。
### 响应事件
视图对象是响应者对象——UIResponder 类的实例对象——因此能够接收触摸事件。当一个触摸事件发生的时候，窗口会将相应的触摸对象分发至触摸的视图。若你的视图对触摸事件不感兴趣，它可以忽略它，或将其沿响应链条传递给一个不同的处理对象。  
除了直接处理触摸事件之外，视图还可以使用手势来检测轻触、滑动、聚合以及其它常用的触摸相关的手势。手势对于追踪触摸事件做了很多工作，并确保它们按照正确的标准来限定它们作为目标手势。你的应用程序无需追踪触摸事件，直接创建手势即可，然后将一个适当的目标对象和响应事件方法赋值给它，使用 addGestureRecognizer: 方法来将该手势为你的视图初始化。那么在相应的触摸事件发生的时候，手势就会调用你的响应方法了。  
若你更倾向于直接处理触摸事件，你可以实现你的视图的以下方法，在“iOS事件处理指南”中有更详细的描述：  

	touchesBegan:withEvent:
	touchesMoved:withEvent:
	touchesEnded:withEvent:
	touchesCancelled:withEvent:
	
默认的，视图一次只响应一个触摸事件。若用户将第二个手指触摸到屏幕上，系统会忽略该触摸事件，也不会将其报告给你的视图。若你想要在视图的事件处理方法中处理多点触摸手势的话，你需要将视图的 multipleTouchEnabled 属性设置为YES。  
某些视图，比如标签和图片，在初始化时不能够处理事件。你可以通过改变一个视图的 userInteractionEnabled 属性来控制一个视图能否接收触摸事件。在等待一个耗时较长的操作时，你可以将这个属性暂时设置为NO来阻止用户改变当前界面的值。若要阻止所有的视图的触摸事件，你可以使用 UIApplication 对象的 beginIgnoringInteractionEvents 和 endIgnoringInteractionEvents 方法。这些方法作用于整个应用程序而非一个单独的视图。  

> 注意：UIView的动画相关的方法通常在执行动画期间会无法接收触摸事件。你可以通过配置动画来重写这一行为。更多关于执行动画的相关信息，参见“动画”一章。

在处理触摸事件时，UIKit使用 UIView 的 hitTest:withEvent: 和 pointInside:withEvent: 方法来判断触摸事件是否发生在给定的视图的区域内。尽管你很少需要重写这些方法，不过你可以通过实现这些方法来定制你自己的视图的自定义触摸事件。比如，你可以重写这些方法来阻止子视图获取触摸事件。
### 为你的视图进行清理
若你的视图类分配了任何内存，存储了任何自定义对象的引用或持有了在视图被释放的时候必须被释放的资源，那你必须实现 dealloc 方法。系统会在你的视图的引用计数达到0并在释放你的视图的时机调用 dealloc 方法。实现该方法时，你应当释放任何被视图持有的对象或资源然后调用父类的实现，就像清单3-5一样。你不应当使用该方法执行任何其他类型的任务。  

清单3-5 实现 dealloc 方法  

	- (void)dealloc {
    	// Release a retained UIColor object
	    [color release];
 
   		 // Call the inherited implementation
	    [super dealloc];
	}

# 动画
动画为你的用户界面的不同状态之间的转换提供了流动的可视化效果。在iOS当中，动画在重新布置视图的位置，改变它们的尺寸，从视图层级中移除以及隐藏视图当中被大量的使用。你可以使用动画来传递给用户反馈或者实现有趣的可视化效果。  
在iOS当中，创建复杂的动画并不需要你编写任何绘制代码。本章提到的所有的动画技术都使用的Core Animation提供的内建支持。你只需要触发动画然后让Core Animation处理每一帧的渲染即可。这使得创建复杂动画非常简单，并且只用编写几行代码。
## 什么能够被动画展示？

## 一个视图中的动画属性变更

### 使用基于块的方法来开始动画

### 使用开始／提交的方法来开始动画

#### 为开始／提交动画配置参数

#### 配置动画代理

### 嵌套动画块

### 实现回调动画本身

## 在视图转场之间创建动画

### 改变一个视图的子视图

### 替换一个视图为不同的视图

## 链接多个动画

## 动画改变视图和层的变更