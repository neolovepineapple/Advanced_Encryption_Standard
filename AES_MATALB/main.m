 warning('off')

%�����ı��ļ���ַ
file_path='/Users/renminluqijiandian/Documents/SYSU/��ѧ/Ӧ������ѧ/script/files/GREreading.txt';
text=char(fread(fopen(file_path))');
%��ʼ����
key='neolovepineapple';
%keyexpansion
key=KeyExpansion(key);
%���ܣ����ܺ���ַ���Ϊc_text
text_encription=AES_Encryption(text,key);

text_decryption=AES_Decryption(encription,key);
