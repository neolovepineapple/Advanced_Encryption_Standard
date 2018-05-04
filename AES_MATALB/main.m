 warning('off')

%加密文本文件地址
file_path='/Users/renminluqijiandian/Documents/SYSU/数学/应用密码学/script/files/GREreading.txt';
text=char(fread(fopen(file_path))');
%初始密码
key='neolovepineapple';
%keyexpansion
key=KeyExpansion(key);
%加密，加密后的字符串为c_text
text_encription=AES_Encryption(text,key);

text_decryption=AES_Decryption(encription,key);
