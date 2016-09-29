// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

void main(){
  querySelector('#output').text = 'running';
  querySelector('#showme').text = '2,5,1,8,7';
  querySelector('#sample_text_id').onClick.listen(sort);
}
void sort(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var list=new List();
  list=[2,5,1,8,7];
  int i, j,k;
  for (i = 0; i< list.length;i++) {
    for(j = 0; j< list.length-i-1;j++){
      if (list[j]> list[j+1])
    {k= list[j];
    list[j] = list[j+1];
    list[j+1] =k; }
  }}
  var buffer = new StringBuffer();
  for (int i =0;i< list.length;i++) {
    buffer.write(list[i]);querySelector('#showme').text = buffer.toString();
}}
