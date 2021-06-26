%penyelesaian kasus menggunakan metode WP
clc;clear; %untuk membersihkan jendela command windows

opts = detectImportOptions('Real estate valuation data set.xlsx');%import data dari exel ke matlab
opts.SelectedVariableNames = [3:5 8];%mengambil kolom3 sampai 5 dan kolom 8
data = readmatrix('Real estate valuation data set.xlsx',opts);%membaca data
x=data(1:50,:);%memilih 50 data teratas
k = [0,0,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan 0= atribut biaya
w = [3,5,4,1];%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3= cukup, 4= tinggi, 5= sangat tinggi)

%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%tahapan ketiga, proses perangkingan
V= S/sum(S)

%mengurutkan nilai dari V dari yang terbesar hingga terkecil 
[nilai nmbr] = sort(V,'descend');

%meranking 5 nilai terbesar beserta no datanya
disp("5 Data Rekomendasi Real Estate :");
for rank =1:5,
    urt = ['Data ke-', num2str(nmbr(rank)), ' dengan nilai V = ',num2str(nilai(rank))];
    disp(urt)
end;

