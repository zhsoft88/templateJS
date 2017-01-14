// template.js by zhsoft88 at 2016.12.8
// copyright (c) 2017 zhuatang.com

function Template(source) {
  function escaped(str) {
    var result = '';
    for (var i = 0; i < str.length; i++) {
      var c = str[i];
      if (c == '\\') {
        result += '\\\\';
      } else if (c == '"') {
        result += '\\"';
      } else if (c == '\n') {
        result += '\\n';
      } else {
        result += c;
      }
    }
    return result;
  }
  var script = 'this.render = function(o){';
  script += 'var out="";';
  var len = source.length;
  var i = 0;
  while (i < len) {
    var str = '';
    // skip to <@
    while (i < len) {
      if (source.substr(i, 2) == '<@') {
        i += 2;
        break;
      }
      str += source[i];
      i++;
    }
    script += 'out+="' + escaped(str) + '";';
    if (i == len)
      break;
    
    var foundExpr = false;
    if (source[i] == '=') {
      foundExpr = true;
      i++;
      if (i == len)
        break;
    }
    
    if (foundExpr) {
      script += 'out+=';
    }
    
    // get until @>
    var str = '';
    while (i < len) {
      if (source.substr(i, 2) == '@>') {
        i += 2;
        break;
      }
      str += source[i];
      i++;
    }
    
    script += str;

    if (foundExpr) {
      script += ';';
    }
  }
  script += 'return out;}';
  eval(script);
}
