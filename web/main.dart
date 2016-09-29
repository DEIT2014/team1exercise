// Copyright (c) 2016, wqwtsr. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

void main(){
  querySelector('#sample_text_id')
    .. text = "2,5,1,8,7"
    ..onClick.listen(sort);
}

  void sort(MouseEvent event){
    var text = querySelector('#sample_text_id').text;
    var buffer = new StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      buffer.write(text[i]);
    }
    int i,j;
    for(i=2;i<=text.length;++i)
      if (int.parse(text[i])<int.parse(text[i-1]))
      {
      int.parse(text[0])=int.parse(text[i]);
      int.parse(text[i])=int.parse(text[i-1]);
        for(j=i-2;int.parse(text[0])<int.parse(text[j]);--j)
      int.parse(text[j+1])=int.parse(text[0]);
      }
    for ( i = 0; i <= text.length; i++) {
      buffer.write(text[i]);}
    querySelector('#sample_text_id').text = buffer.toString();
  }
