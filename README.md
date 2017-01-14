# templateJS - Lightweight JavaScript Template Engine

## Description
See details at [templateJS](http://zhuatang.com/templateJS.jsp).

## Usage

```html
<script src="js/template-1.0.min.js"></script>
```

Add template as script:

```html
<script type="text/template" id="test-template">
<h3><@= o.title @></h3>
<ol>
<@ for (var i = 0; i < o.features.length; i++) {
     var item = o.features[i]; @>
<li><@= item.name @> <@ if (item.desc) { out += '<i>' + item.desc + '</i>'; } @></li>
<@ } @>
</ol>
<p><b><@= o.author @></b></p>
</script>
```

Define data modal:

```js
var data = { 
  title: 'templateJS: lightweight JavaScript Template Engine',
  features: [
    { name: 'Build with pure JavaScript' },
    { name: 'Lightweight and Fast', desc: 'less than 600 bytes' },
    { name: 'Simple and Ease of use' }
  ],
  author: 'zhsoft88@icloud.com'
};
```

Render result:

```js
var source = document.getElementById('test-template').innerText;
var tmpl = new Template(source);
var result = tmpl.render(data);
document.getElementById("output").innerHTML = result;
```

## Template Language Guide

```html
<@= JavaScript_Expression @>
```

```html
<@ Any_JavaScript_Codes @>
```

```js
o - Use it to reference template data modal
```

```js
out - Use it to reference termplate output stream
```

