# Dasar-Algorima-Pemrograman
program Data_penduduk;
uses crt;
const
  nmax = 10;

type data = record
  nokk: Integer;
	nik_istri,nik_suami,menikah: String;
	nama_suami,nama_istri,anak1,anak2,ada_suami,ada_istri :String;
	kelamin,kecamatan,status,Tempat : String;
end;
type
  data1 = record
  kecamatan : string; 
  jumpduk : integer;   
end;

type kcm = array[1..2] of data1;
type Pdk = array [1..nmax] of data;

var
    jum: integer;
    ktp: pdk;
    tempat:kcm;
/////////////////////////////////////////////////////////////////////////////////////////////////INPUT DATA//////////////////////////////////////////////////////////////////////////////////////////////////////////


        function search_isi (t: pdk):integer;
        var
          j: integer;
        begin
          j :=0;
            repeat 
              j:=j+1;
              if(t[j].nokk <>0)then
                search_isi := j
              else
                search_isi := -1;
            until (t[j].nokk <> 0) and (j<nmax);
        end;}

        function search_kosong (t: pdk):integer;
        var
          j: integer;
        begin
          j :=0;
            repeat 
             j:= j+1;
              if(t[j].nokk = 0) then
                search_kosong:= j
              else
                search_kosong := -1;
            until(t[j].nokk = 0) and (j<nmax);
        end;



        function search_data(t:pdk; x: integer): Integer;
        var
          j: Integer;
        begin
          j:=1;
          while ((t[j].nokk <> x) and (j < nmax)) do
            j:=j+1;
          if(t[j].nokk = x)then
            search_data:= j
          else
            search_data := -1;
        end;

        function cek_istri(t:pdk; x: string): Boolean;
        var
          j: Integer;
        begin
          j:= 1;
          while (t[j].nik_istri<> x) and (j<nmax) do
            j:=j+1;
          if(t[j].nik_istri = x)then
            cek_istri:= false
          else
            cek_istri:= True;
        end;


        procedure menikah1(var t:pdk);
        var
          ada_anak,ceknik: String;
          n: integer;
          e: Boolean;
        begin
          clrscr;
          n:= search_kosong(t);

          if (n <> -1) then
          begin
                Writeln('Masukkan Kecamatan A/B ');
                readln(t[n].kecamatan);
                if (t[n].kecamatan <> 'A') and (t[n].kecamatan <> 'a') and (t[n].kecamatan <>'B') and (t[n].kecamatan <> 'b') then
                begin
                  repeat
                    writeln('Inputan Anda Tidak Valid ');
                    readln(t[n].kecamatan);
                  until (t[n].kecamatan = 'A') or (t[n].kecamatan = 'a') or (t[n].kecamatan = 'B') or (t[n].kecamatan = 'b');
                end;
                writeln('Masukan Nik Suami 5 digit Angka ');
                readln(t[n].nik_suami);
                if (length(t[n].nik_suami)<>5)  then
                begin
                  repeat
                    writeln('Inputan tidak valid, Masukkan Ulang ');
                    readln(t[n].nik_suami);
                  until (length(t[n].nik_suami)=5);
                end;
                writeln('Masukkan Nama Suami ');
                readln(t[n].nama_suami);
                repeat 
                  write('Masukan No.ktp Anda [5 digit Angka] ');
                  readln(ceknik);
                    if (length(ceknik)<>5) then
                    begin
                      repeat
                        writeln('Inputan tidak valid, Masukkan Ulang ');
                        readln(ceknik);
                      until (length(ceknik)=5);
                    end;
                  e:= cek_istri(t,ceknik);
                  if(e = false ) then
                    writeln('Data Anda Terduplikasi ');
                until (e = True);
                t[n].nik_istri:= ceknik;
                writeln('Masukkan Nama Istri ');
                readln(t[n].nama_istri);                
                writeln('Apakah Anda Punya Anak ,Y/N ');
                readln(ada_anak);
                if (ada_anak <> 'Y') and (ada_anak <>'y') and (ada_anak <> 'n') and (ada_anak <>'N') then
                begin
                  repeat
                    writeln('Harap Menggunakan Huruf kapital ');
                    writeln('Inputan Anda salah, Masukkan ulang ');
                    readln(ada_anak);
                  until (ada_anak = 'Y') or (ada_anak = 'y') and (ada_anak = 'n') and (ada_anak = 'N');
                end;
                if(ada_anak = 'Y') or (ada_anak = 'y') then
                begin
                        writeln('Masukkan Nama Anak Pertama ');
                        readln(t[n].anak1);
                        writeln('HARAP Menggunakan Huruf kapital');
                        writeln('Apakah Ada anak Lagi Y/N ');
                        readln(ada_anak);
                        if (ada_anak <> 'Y') and (ada_anak <> 'y') and (ada_anak <> 'n') and (ada_anak <>'N') then
                        begin
                                repeat
                                        writeln('Harap Menggunakan Huruf Kapital !!! ');
                                        writeln('Inputan Anda salah, Masukkan ulang ');
                                        readln(ada_anak);
                                until (ada_anak = 'Y') and (ada_anak = 'N');
                        end;
                        if (ada_anak = 'Y') or (ada_anak = 'y') then
                        writeln('Masukkan Nama Anak Kedua ');
                        readln(t[n].anak2);
                end;
                t[n].status := 'Pernah Menikah ';
                t[n].nokk := 50000+n;
                jum:=jum+1;
        end
        else
                writeln('Maaf Anda Tidak Bisa Input Lagi');
        readln;      
        end;



        procedure pernah_menikah(var t:pdk);
        var
          ada_anak,ceknik:string;
          kelamin: string;
          n: Integer;
          e: Boolean;
        begin
        clrscr;
        n:= search_kosong(t);
        if (n <> -1) then
        begin
                Writeln('Masukkan Kecamatan A/B ');
                readln(t[n].kecamatan);
                if (t[n].kecamatan <> 'A') and (t[n].kecamatan <> 'a') and (t[n].kecamatan <>'B') and (t[n].kecamatan <> 'b') then
                begin
                  repeat
                    writeln('Inputan Anda Tidak Valid ');
                    readln(t[n].kecamatan);
                  until (t[n].kecamatan = 'A') or (t[n].kecamatan = 'a') or (t[n].kecamatan = 'B') or (t[n].kecamatan = 'b');
                end;
                write(' Apakah Anda Laki-laki Y/N ');
                readln(kelamin);
                if(kelamin <> 'Y') and (kelamin <> 'y') and (kelamin <> 'N') and (kelamin <> 'n') then
                begin
                        repeat
                                write(' Inputan tidak Valid, Masukkan Ulang ');
                                readln(kelamin);
                        until (kelamin = 'Y') or (kelamin = 'y') or (kelamin = 'N') or (kelamin = 'n');
                end;
                if (kelamin = 'Y') or (kelamin = 'y') then
                begin
                  write('Masukan No.ktp Anda [5 digit Angka] ');
                  readln(t[n].nik_suami);
                  if (length(t[n].nik_suami)<>5) then
                  begin
                    repeat
                      write('Inputan tidak valid, Masukkan Ulang ');
                      readln(t[n].nik_suami);
                    until (length(t[n].nik_suami)=5);
                  end;
                  write('Masukkan Nama Suami ');
                  readln(t[n].nama_suami);
                end
                else
                begin
                  write('Masukan No.ktp Anda [5 digit Angka] ');
                  readln(ceknik);
                  e:= cek_istri(t,ceknik);
                  if (e = false) then
                  begin
                    repeat
                      write('Inputan tidak valid, Masukkan Ulang ');
                      readln(ceknik);
                      e:= cek_istri(t,ceknik);
                    until (e = True);
                    t[n].nik_istri:= ceknik;
                  end;
                  write('Masukkan Nama Istri ');
                  readln(t[n].nama_istri);
                end;            
                writeln('Apakah Anda Punya Anak ,Y/N ');
                readln(ada_anak);
                if (ada_anak <> 'Y') and (ada_anak <> 'y') and (ada_anak <>'N') and (ada_anak <> 'n') then
                begin
                        repeat
                                writeln('Inputan Anda salah, Masukkan ulang ');
                                readln(ada_anak);
                        until (ada_anak = 'Y') or (ada_anak = 'y') or (ada_anak = 'N') or (ada_anak = 'n');
                end;
                if (ada_anak = 'Y') or (ada_anak = 'y') then
                begin
                        writeln('Masukkan Nama Anak Pertama ');
                        readln(t[n].anak1);
                        writeln('HARAP Menggunakan Huruf kapital');
                        writeln('Apakah Ada anak Lagi Y/N ');
                        readln(ada_anak);
                        if (ada_anak <> 'Y') and (ada_anak <> 'y') and (ada_anak <>'N') and (ada_anak <> 'n') then
                        begin
                                repeat
                                        writeln('Inputan Anda salah, Masukkan ulang ');
                                        readln(ada_anak);
                                 until (ada_anak = 'Y') or (ada_anak = 'y') or (ada_anak = 'N') or (ada_anak = 'n');
                        end;
                        if(ada_anak = 'Y') then
                        writeln('Masukkan Nama Anak Kedua ');
                        readln(t[n].anak2);
                end;
                t[n].status := 'Pernah Menikah ';
                t[n].nokk := 50000+n;
                jum:= jum+1;
        end
        else
          writeln('Maaf Anda Tidak Bisa Input Lagi ');
        readln;      
        end;

        procedure tidak_menikah(var t:pdk);
        var
          kelamin,ceknik: string;
          n: integer;
          e: Boolean;
        begin
          clrscr;
          n:= search_kosong(t);
          if (n <> -1) then
          begin
            writeln(n);
            Writeln('Masukkan Kecamatan A/B ');
            readln(t[n].kecamatan);
            if (t[n].kecamatan <> 'A') and (t[n].kecamatan <>'B') then
            begin
              repeat
                writeln('Inputan Anda Tidak Valid ');
                readln(t[n].kecamatan);
              until (t[n].kecamatan = 'A') or (t[n].kecamatan = 'B');
            end;
            write('Masukkan jenis kelamin L/P ');
            readln(kelamin);
            if(kelamin <>'L' ) and (kelamin <>'P')then
            begin
              repeat
                writeln('Harap Menggunakan Huruf Kapital ');
                writeln(' Inputan Tidak Valid, Masukkan Ulang ');
                readln(kelamin);
              until (kelamin = 'L') or (kelamin = 'P');
            end;
            if(kelamin = 'L')then
            begin
              write('Masukan No.Ktp Anda [5 digit Angka] ');
              readln(t[n].nik_suami);
              if(length(t[n].nik_suami)<>5) then
              begin
                repeat
                  write('Inputan tidak valid, Masukkan Ulang ');
                  readln(t[n].nik_suami);
                until (length(t[n].nik_suami)=5);
              end;
              write('Masukkan Nama Suami ');
              readln(t[n].nama_suami);
            end                                           
            else
            begin
              repeat 
                write('Masukan No.ktp Anda [5 digit Angka] ');
                readln(ceknik);
                if (length(ceknik)<>5) then
                begin
                  repeat
                    writeln('Inputan tidak valid, Masukkan Ulang ');
                    readln(ceknik);
                  until (length(ceknik)=5);
                end;
                e:= cek_istri(t,ceknik);
                if(e = false ) then
                  writeln('Data Anda Terduplikasi ');
              until (e = True);
              t[n].nik_istri:= ceknik;
              write('Masukkan Nama Istri ');
              readln(t[n].nama_istri);
            end;
            t[n].status:= 'Tidak Menikah ';
            t[n].nokk := 5000+n;
            jum:=jum+1;      
          end
          else
            writeln('Maaf Anda Tidak Bisa Input Lagi ');
          readln;
          end;

          procedure edit_data(var t:pdk);
          var
            n,nokk: Integer;
            ktpsuami,ktpistri,namasuami,namaistri,anak1,anak2 : string;
          begin
            n:= jum;
            writeln('Masukkan Kode kk yang akan di rubah ');
            readln(nokk);
            if(jum<>0) then
            begin
              writeln('Rubah yang di Perlukan Saja Bila tidak Ingin Merubah Tekan Enter ');
              writeln('=================================================================');
              write('Masukkan No.Ktp Suami ');
              readln(ktpsuami);
              write('Masukkan Nama Suami ');
              readln(namasuami);
              write('Masukkan No.Ktp istri ');
              readln (ktpistri);
              write('Masukkan Nama Istri ');
              readln(namaistri);
              write('Masukkan Nama Anak Pertama ');
              readln(anak1);
              write('Masukkan Nama Anak Kedua ');
              readln(anak2);
              if(length(ktpsuami)>0)then
                t[n].nik_suami:= ktpsuami;
              if(length(namasuami)>0)then
                t[n].nama_suami:= namasuami;
              if(length(ktpistri)>0)then
                t[n].nik_istri:= ktpistri;
              if(length(namaistri)>0) then
                t[n].nama_istri:= namaistri;
              if(length(anak1)>0) then
                t[n].anak1 := anak1;
              if(length(anak2)>0) then
                t[n].anak2 := anak2;
            end
            else
              Writeln('Data Tidak ditemukan ');
          end;

          procedure delete_data(var t:pdk);
          var
            n,nokk: Integer;
            kk,ktpsuami,ktpistri,data,namasuami,namaistri,anak1,anak2 : string;
          begin
            write('Masukkan Kode Kk yang akan di hapus ');
            readln(nokk);
            n:=search_data(t,nokk);
            if(n<>-1)then
            begin
              write('Data Yang Dihapus Semua Tekan Y  Jika Tidak Tekan T ');
              readln(data);
              while(data <> 'Y') or (data <>'N') do
                  write('Inputan Anda Tidak Valid ');
                  readln(data);
              if(data = 'N') then
              begin
                write('Apakah No.KTP Suami Dihapus ');
                readln(ktpsuami);
                write('Apakah Nama Suami Dihapus ');
                readln(namasuami);
                write('Apakah No.Ktp Istri Dihapus ');
                readln(ktpistri);
                write('Apakah Nama Istri Dihapus ');
                readln(namaistri);
                write('Apakah Nama Anak Pertama Dihapus ');
                readln(anak1);
                write('Apakah Nama Anak Kedua Dihapus ');
                readln(anak2);
                write('Apakah No KK Dihapus ');
                readln(kk);
                if(ktpsuami = 'Y') or (ktpsuami = 'y') then
                  t[n].nik_suami := ' ';
                if(namasuami = 'Y') or (namasuami = 'y') then
                  t[n].nama_suami := ' ';
                if(ktpistri = 'Y') or (ktpistri = 'y') then
                t[n].nik_istri := ' ';
                if(namaistri = 'Y') or (namaistri = 'y') then
                  t[n].nama_istri :=' ';
                if(anak1 = 'Y') or (anak1 = 'y')then
                  t[n].anak1 := ' ';
                if(anak2 = 'Y') or (anak1 ='y')then
                  t[n].anak2 := ' ';
                if(kk = 'Y') or (kk = 'y') then
                  t[n].nokk := 0;
              end
              else
                t[n].nik_suami := ' ';
                t[n].nama_suami := ' ';
                t[n].nik_istri := ' ';
                t[n].nama_istri :=' ';
                t[n].anak1 := ' ';
                t[n].anak2 := ' ';
                t[n].status:= ' ';
            end
            else
              writeln('Data Tidak ditemukan ');
          end;

          procedure edit_sukasuka();
          var
            pilihan: string;
          begin
          repeat
            writeln('=========================== ');
            writeln(' 1. Edit Data ');
            writeln(' 2. Hapus Data');
            writeln(' 3. Keluar ');
            readln(pilihan);
            if(pilihan <> '1') and (pilihan <>'2') and (pilihan <> '3') then
            repeat
              write('Inputan Anda Tidak Valid ');
              readln(pilihan);
            until (pilihan = '1') or (pilihan ='2') or (pilihan ='3'); 
            case pilihan of
              '1': edit_data(ktp);
              '2': delete_data(ktp);
            end;
          until(pilihan = '3');
          readln;
          end; 

          procedure sorting_selection(var r:kcm; k: integer);
          var
            temp: string;
            i,j,min: integer;
           begin
             for i := 1 to k-1 do
              min:=i;
              for j:= i+1 to k do
               if (r[i].kecamatan < r[min].kecamatan) then
                min:= j;
            temp:= r[min].kecamatan;
            r[min].kecamatan:= r[i].kecamatan;
            r[i].kecamatan:= temp;
            end;

          procedure showdata (var t:pdk);
          var
            j: Integer;
          begin
            clrscr;
            j:=0;
            if (jum <> 0) then
            begin
                repeat
                  begin
                    J:=J+1;
                    writeln('=================================================');
                    writeln('==============  Status Penduduk  ================');
                    writeln(' No Kartu Keluarga ',t[j].nokk);
                    writeln(' kecamatan anda ',t[j].kecamatan);
                    writeln(' Status Penduduk ',t[j].status);
                    writeln(' No.Ktp Suami ',t[j].nik_suami);
                    writeln(' Nama Suami ',t[j].nama_suami);
                    writeln(' No.Ktp Istri ',t[j].nik_istri);
                    writeln(' Nama Istri ',t[j].nama_istri);
                    writeln(' Nama Anak Pertama ',t[j].anak1);
                    writeln(' Nama Anak Kedua ',t[j].anak2);
                    writeln;
                    writeln('=================================================');
                    writeln('=================================================');
                  end;
                until (j>=jum);
            end
            else
              writeln('Maaf Anda Belum Melakukan Input Data ');
          readln;
          end;
        procedure jumlahwarga(t:pdk; r: kcm);
        var
          i,j,sum: Integer;
        begin
          if(jum <> 0 )then
          begin
            for i:=1 to 2 do
            begin
              sum:=0;
              for j:= 1 to jum do
                if(t[j].kecamatan = r[i].kecamatan) then
                  begin
                    if (length(t[j].nama_suami)<>0) then
                      sum:= sum+1;
                    if (length(t[j].nama_istri)<>0) then
                      sum:= sum+1;
                    if (length(t[j].anak1)<>0) then
                      sum:= sum+1;
                    if(length(t[j].anak2)<>0) then
                      sum:= sum+1;
                  end;
              r[i].jumpduk:= sum;
            end;
            sorting_selection(r,i);
            writeln('Data terurut Berdasarkan jumlah /Perkeluarga ');
            for i:= 1 to 2 do
              writeln('Kecamatan ',r[i].kecamatan,' Dengan Jumlah Penduduk ',r[i].jumpduk);
          end 
          else
            writeln('Anda Belum Input Data ');
          readln;
        end;


        procedure Lihat_penduduk ();
        var
          pilihan: string;
        begin
        repeat
          clrscr;
          writeln('=============================');
          writeln('==== Lihat data Penduduk ====');
          writeln('1 : Berdasarkan Perkepala Keluarga ');
          writeln('2 : Berdasarkan Kecamatan ');
          writeln('3 : Keluar ');
          writeln;
          readln(pilihan);
          writeln('=============================');
          if (pilihan <> '1') and (pilihan <> '2') and (pilihan <> '3') then
          begin
            repeat
              write('Maaf, Inputan Anda Tidak Valid ');
              readln(pilihan);
            until (pilihan = '1') or (pilihan = '2') or (pilihan ='3');
          end;
          case pilihan of
          '1' : showdata(ktp);
          '2' : jumlahwarga(ktp,tempat);
          end;
        until(pilihan = '3');
        end;

        procedure keluarga_Status ();
        var
          pilihan: string;
        begin
          repeat
            clrscr;
            writeln('====================================');
            writeln('===== MASUKKAN STATUS KELUARGA =====');
            Writeln('1 : Menikah ');
            writeln('2 : Pernah Menikah ');
            writeln('3 : Tidak menikah ');
            writeln('4 : Edit Data ');
            writeln('5 : Keluar ');
            Writeln(search_kosong(KTP));
            writeln;
            writeln('====================================');
            readln(pilihan);
              if(pilihan <> '1') and (pilihan <>  '2') and (pilihan <> '3') and (pilihan <>'4') and (pilihan <>'5') then
                begin
                  repeat
                    writeln('Inputan Anda Tidak Valid, masukkan Ulang ');
                    readln(pilihan);
                  until (pilihan = '1') or (pilihan ='2') or (pilihan = '3') or (pilihan = '4') or (pilihan = '5');
                end;
                    case pilihan of
                    '1' : menikah1(ktp);
                    '2' : Pernah_menikah(ktp);
                    '3' : tidak_menikah(ktp);
                    '4' : edit_sukasuka();
                    end;
          until(pilihan='5');
        end;

        procedure Menu();
        var
          i_menu: Integer;
        begin
          repeat
            begin
              clrscr;
              writeln('====================================================');
              writeln('========= Aplikasi Penghitung Data Penduduk ========');
              writeln('====================================================');
              writeln;
              writeln('====== Menu Aplikasi Penghitung Data Penduduk ======');
              writeln(' 1. Masukkan Data penduduk ');
              writeln(' 2. Jumlah Penduduk ');
              writeln(' 3. Keluar Program ');
              writeln(' Pilih Menu  : ');
              readln(i_menu);
              case i_menu of
                1 : keluarga_Status();
                2 : Lihat_penduduk();
              else if(i_menu>3) and (i_menu<0) then
                    repeat
                      write(' Maaf, Inputan Anda Salah | Masukkan Ulang ');
                      readln(i_menu);
                    until (i_menu<4) or (i_menu>0);
              end;
            end;
          until(i_menu = 3);
        end;
begin
  tempat[1].kecamatan := 'A';
  tempat[2].Kecamatan := 'B';
  jum:=0;
  menu();
end.
