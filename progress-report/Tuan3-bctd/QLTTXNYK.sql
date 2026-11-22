/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     11/18/2026 4:01:46 PM                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHISOXETNGHIEM') and o.name = 'FK_CHISOXET_CO_CHI_SO_LOAIXETN')
alter table CHISOXETNGHIEM
   drop constraint FK_CHISOXET_CO_CHI_SO_LOAIXETN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETPHIEU') and o.name = 'FK_CHITIETP_BAO_GOM_PHIEUXET')
alter table CHITIETPHIEU
   drop constraint FK_CHITIETP_BAO_GOM_PHIEUXET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETPHIEU') and o.name = 'FK_CHITIETP_DUOC_CHI__LOAIXETN')
alter table CHITIETPHIEU
   drop constraint FK_CHITIETP_DUOC_CHI__LOAIXETN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KETQUA') and o.name = 'FK_KETQUA_DUOC_QUY__CHISOXET')
alter table KETQUA
   drop constraint FK_KETQUA_DUOC_QUY__CHISOXET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KETQUA') and o.name = 'FK_KETQUA_DUYET_TAIKHOAN')
alter table KETQUA
   drop constraint FK_KETQUA_DUYET_TAIKHOAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KETQUA') and o.name = 'FK_KETQUA_GOM_CO_CHITIETP')
alter table KETQUA
   drop constraint FK_KETQUA_GOM_CO_CHITIETP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KETQUA') and o.name = 'FK_KETQUA_NHAP_TAIKHOAN')
alter table KETQUA
   drop constraint FK_KETQUA_NHAP_TAIKHOAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOAIXETNGHIEM') and o.name = 'FK_LOAIXETN_GOM_NHOMXETN')
alter table LOAIXETNGHIEM
   drop constraint FK_LOAIXETN_GOM_NHOMXETN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MAUXETNGHIEM') and o.name = 'FK_MAUXETNG_CO_PHIEUXET')
alter table MAUXETNGHIEM
   drop constraint FK_MAUXETNG_CO_PHIEUXET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUXETNGHIEM') and o.name = 'FK_PHIEUXET_CO_DUOC_BENHNHAN')
alter table PHIEUXETNGHIEM
   drop constraint FK_PHIEUXET_CO_DUOC_BENHNHAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUXETNGHIEM') and o.name = 'FK_PHIEUXET_TIEP_NHAN_TAIKHOAN')
alter table PHIEUXETNGHIEM
   drop constraint FK_PHIEUXET_TIEP_NHAN_TAIKHOAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THANHTOAN') and o.name = 'FK_THANHTOA_DUOC_THAN_PHIEUXET')
alter table THANHTOAN
   drop constraint FK_THANHTOA_DUOC_THAN_PHIEUXET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THANHTOAN') and o.name = 'FK_THANHTOA_THU_TIEN_TAIKHOAN')
alter table THANHTOAN
   drop constraint FK_THANHTOA_THU_TIEN_TAIKHOAN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BENHNHAN')
            and   type = 'U')
   drop table BENHNHAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHISOXETNGHIEM')
            and   name  = 'CO_CHI_SO_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHISOXETNGHIEM.CO_CHI_SO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHISOXETNGHIEM')
            and   type = 'U')
   drop table CHISOXETNGHIEM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETPHIEU')
            and   name  = 'DUOC_CHI_DINH_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETPHIEU.DUOC_CHI_DINH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETPHIEU')
            and   name  = 'BAO_GOM_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETPHIEU.BAO_GOM_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETPHIEU')
            and   type = 'U')
   drop table CHITIETPHIEU
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KETQUA')
            and   name  = 'DUYET_FK'
            and   indid > 0
            and   indid < 255)
   drop index KETQUA.DUYET_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KETQUA')
            and   name  = 'NHAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index KETQUA.NHAP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KETQUA')
            and   name  = 'DUOC_QUY_DINH_BOI_FK'
            and   indid > 0
            and   indid < 255)
   drop index KETQUA.DUOC_QUY_DINH_BOI_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KETQUA')
            and   name  = 'GOM_CO_FK'
            and   indid > 0
            and   indid < 255)
   drop index KETQUA.GOM_CO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KETQUA')
            and   type = 'U')
   drop table KETQUA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOAIXETNGHIEM')
            and   name  = 'GOM_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOAIXETNGHIEM.GOM_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOAIXETNGHIEM')
            and   type = 'U')
   drop table LOAIXETNGHIEM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MAUXETNGHIEM')
            and   name  = 'CO_FK'
            and   indid > 0
            and   indid < 255)
   drop index MAUXETNGHIEM.CO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MAUXETNGHIEM')
            and   type = 'U')
   drop table MAUXETNGHIEM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHOMXETNGHIEM')
            and   type = 'U')
   drop table NHOMXETNGHIEM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUXETNGHIEM')
            and   name  = 'TIEP_NHAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUXETNGHIEM.TIEP_NHAN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUXETNGHIEM')
            and   name  = 'CO_DUOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUXETNGHIEM.CO_DUOC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUXETNGHIEM')
            and   type = 'U')
   drop table PHIEUXETNGHIEM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TAIKHOAN')
            and   type = 'U')
   drop table TAIKHOAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THANHTOAN')
            and   name  = 'THU_TIEN_FK'
            and   indid > 0
            and   indid < 255)
   drop index THANHTOAN.THU_TIEN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THANHTOAN')
            and   name  = 'DUOC_THANH_TOAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index THANHTOAN.DUOC_THANH_TOAN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THANHTOAN')
            and   type = 'U')
   drop table THANHTOAN
go

/*==============================================================*/
/* Table: BENHNHAN                                              */
/*==============================================================*/
create table BENHNHAN (
   MABN                 int                  identity,
   HOTEN                nvarchar(100)        null,
   NGAYSINH             datetime             null,
   GIOITINH             nvarchar(10)         null,
   SODIENTHOAI          varchar(15)          null,
   DIACHI               nvarchar(225)        null,
   constraint PK_BENHNHAN primary key nonclustered (MABN)
)
go

/*==============================================================*/
/* Table: CHISOXETNGHIEM                                        */
/*==============================================================*/
create table CHISOXETNGHIEM (
   MACHISO              int                  identity,
   MAXN                 int                  not null,
   MACODE               varchar(20)          null,
   TENCHISO             nvarchar(100)        null,
   DONVITINH            nvarchar(50)         null,
   GIATRIMIN            decimal(10,2)        null,
   GIATRIMAX            decimal(10,2)        null,
   MOTA                 nvarchar(255)        null,
   constraint PK_CHISOXETNGHIEM primary key nonclustered (MACHISO),
   constraint AK_IDENTIFIER_2_CHISOXET unique (MACODE)
)
go

/*==============================================================*/
/* Index: CO_CHI_SO_FK                                          */
/*==============================================================*/
create index CO_CHI_SO_FK on CHISOXETNGHIEM (
MAXN ASC
)
go

/*==============================================================*/
/* Table: CHITIETPHIEU                                          */
/*==============================================================*/
create table CHITIETPHIEU (
   MACT                 int                  identity,
   MAPHIEU              int                  not null,
   MAXN                 int                  not null,
   DONGIA               decimal(12)          null,
   constraint PK_CHITIETPHIEU primary key nonclustered (MACT)
)
go

/*==============================================================*/
/* Index: BAO_GOM_FK                                            */
/*==============================================================*/
create index BAO_GOM_FK on CHITIETPHIEU (
MAPHIEU ASC
)
go

/*==============================================================*/
/* Index: DUOC_CHI_DINH_FK                                      */
/*==============================================================*/
create index DUOC_CHI_DINH_FK on CHITIETPHIEU (
MAXN ASC
)
go

/*==============================================================*/
/* Table: KETQUA                                                */
/*==============================================================*/
create table KETQUA (
   MAKQ                 int                  identity,
   MATK_DUYET           int                  null,
   MACHISO              int                  not null,
   MATK_NHAP            int                  not null,
   MACT                 int                  not null,
   GIATRI               decimal(10,2)        null,
   DANHGIA              nvarchar(50)         null,
   NGAYNHAP             datetime             null,
   NGAYDUYET            datetime             null,
   constraint PK_KETQUA primary key nonclustered (MAKQ)
)
go

/*==============================================================*/
/* Index: GOM_CO_FK                                             */
/*==============================================================*/
create index GOM_CO_FK on KETQUA (
MACT ASC
)
go

/*==============================================================*/
/* Index: DUOC_QUY_DINH_BOI_FK                                  */
/*==============================================================*/
create index DUOC_QUY_DINH_BOI_FK on KETQUA (
MACHISO ASC
)
go

/*==============================================================*/
/* Index: NHAP_FK                                               */
/*==============================================================*/
create index NHAP_FK on KETQUA (
MATK_NHAP ASC
)
go

/*==============================================================*/
/* Index: DUYET_FK                                              */
/*==============================================================*/
create index DUYET_FK on KETQUA (
MATK_DUYET ASC
)
go

/*==============================================================*/
/* Table: LOAIXETNGHIEM                                         */
/*==============================================================*/
create table LOAIXETNGHIEM (
   MAXN                 int                  identity,
   MANHOM               int                  not null,
   TENXN                nvarchar(100)        null,
   GIA                  decimal(12)          null,
   TRANGTHAI            nvarchar(30)         null,
   constraint PK_LOAIXETNGHIEM primary key nonclustered (MAXN)
)
go

/*==============================================================*/
/* Index: GOM_FK                                                */
/*==============================================================*/
create index GOM_FK on LOAIXETNGHIEM (
MANHOM ASC
)
go

/*==============================================================*/
/* Table: MAUXETNGHIEM                                          */
/*==============================================================*/
create table MAUXETNGHIEM (
   MAMAU                int                  identity,
   MAPHIEU              int                  not null,
   MASOMAU              varchar(20)          null,
   LOAIMAU              nvarchar(50)         null,
   NGAYLAYMAU           datetime             null,
   constraint PK_MAUXETNGHIEM primary key nonclustered (MAMAU),
   constraint AK_IDENTIFIER_2_MAUXETNG unique (MASOMAU)
)
go

/*==============================================================*/
/* Index: CO_FK                                                 */
/*==============================================================*/
create index CO_FK on MAUXETNGHIEM (
MAPHIEU ASC
)
go

/*==============================================================*/
/* Table: NHOMXETNGHIEM                                         */
/*==============================================================*/
create table NHOMXETNGHIEM (
   MANHOM               int                  identity,
   TENNHOM              nvarchar(100)        null,
   constraint PK_NHOMXETNGHIEM primary key nonclustered (MANHOM)
)
go

/*==============================================================*/
/* Table: PHIEUXETNGHIEM                                        */
/*==============================================================*/
create table PHIEUXETNGHIEM (
   MAPHIEU              int                  identity,
   MATK_TIEPNHAN        int                  not null,
   MABN                 int                  not null,
   MASOPHIEU            varchar(20)          null,
   MATRACUU             varchar(100)         null,
   NGAYTAO              datetime             null,
   TRANGTHAI            nvarchar(50)         null,
   TONGTIEN             decimal(12)          null,
   TRANGTHAITHANHTOAN   nvarchar(30)         null,
   constraint PK_PHIEUXETNGHIEM primary key nonclustered (MAPHIEU),
   constraint AK_IDENTIFIER_2_PHIEUXET unique (MASOPHIEU),
   constraint AK_IDENTIFIER_3_PHIEUXET unique (MATRACUU)
)
go

/*==============================================================*/
/* Index: CO_DUOC_FK                                            */
/*==============================================================*/
create index CO_DUOC_FK on PHIEUXETNGHIEM (
MABN ASC
)
go

/*==============================================================*/
/* Index: TIEP_NHAN_FK                                          */
/*==============================================================*/
create index TIEP_NHAN_FK on PHIEUXETNGHIEM (
MATK_TIEPNHAN ASC
)
go

/*==============================================================*/
/* Table: TAIKHOAN                                              */
/*==============================================================*/
create table TAIKHOAN (
   MATK                 int                  identity,
   TENDANGNHAP          varchar(50)          null,
   MATKHAUHASH          varchar(225)         null,
   HOTEN                nvarchar(100)        null,
   VAITRO               nvarchar(30)         null,
   TRANGTHAI            nvarchar(30)         null,
   constraint PK_TAIKHOAN primary key nonclustered (MATK),
   constraint AK_IDENTIFIER_2_TAIKHOAN unique (TENDANGNHAP)
)
go

/*==============================================================*/
/* Table: THANHTOAN                                             */
/*==============================================================*/
create table THANHTOAN (
   MATT                 int                  identity,
   MATK_THUNGAN         int                  not null,
   MAPHIEU              int                  not null,
   SOTIEN               decimal(12)          null,
   PHUONGTHUC           nvarchar(50)         null,
   NGAYTHANHTOAN        datetime             null,
   constraint PK_THANHTOAN primary key nonclustered (MATT)
)
go

/*==============================================================*/
/* Index: DUOC_THANH_TOAN_FK                                    */
/*==============================================================*/
create index DUOC_THANH_TOAN_FK on THANHTOAN (
MAPHIEU ASC
)
go

/*==============================================================*/
/* Index: THU_TIEN_FK                                           */
/*==============================================================*/
create index THU_TIEN_FK on THANHTOAN (
MATK_THUNGAN ASC
)
go

alter table CHISOXETNGHIEM
   add constraint FK_CHISOXET_CO_CHI_SO_LOAIXETN foreign key (MAXN)
      references LOAIXETNGHIEM (MAXN)
go

alter table CHITIETPHIEU
   add constraint FK_CHITIETP_BAO_GOM_PHIEUXET foreign key (MAPHIEU)
      references PHIEUXETNGHIEM (MAPHIEU)
go

alter table CHITIETPHIEU
   add constraint FK_CHITIETP_DUOC_CHI__LOAIXETN foreign key (MAXN)
      references LOAIXETNGHIEM (MAXN)
go

alter table KETQUA
   add constraint FK_KETQUA_DUOC_QUY__CHISOXET foreign key (MACHISO)
      references CHISOXETNGHIEM (MACHISO)
go

alter table KETQUA
   add constraint FK_KETQUA_DUYET_TAIKHOAN foreign key (MATK_DUYET)
      references TAIKHOAN (MATK)
go

alter table KETQUA
   add constraint FK_KETQUA_GOM_CO_CHITIETP foreign key (MACT)
      references CHITIETPHIEU (MACT)
go

alter table KETQUA
   add constraint FK_KETQUA_NHAP_TAIKHOAN foreign key (MATK_NHAP)
      references TAIKHOAN (MATK)
go

alter table LOAIXETNGHIEM
   add constraint FK_LOAIXETN_GOM_NHOMXETN foreign key (MANHOM)
      references NHOMXETNGHIEM (MANHOM)
go

alter table MAUXETNGHIEM
   add constraint FK_MAUXETNG_CO_PHIEUXET foreign key (MAPHIEU)
      references PHIEUXETNGHIEM (MAPHIEU)
go

alter table PHIEUXETNGHIEM
   add constraint FK_PHIEUXET_CO_DUOC_BENHNHAN foreign key (MABN)
      references BENHNHAN (MABN)
go

alter table PHIEUXETNGHIEM
   add constraint FK_PHIEUXET_TIEP_NHAN_TAIKHOAN foreign key (MATK_TIEPNHAN)
      references TAIKHOAN (MATK)
go

alter table THANHTOAN
   add constraint FK_THANHTOA_DUOC_THAN_PHIEUXET foreign key (MAPHIEU)
      references PHIEUXETNGHIEM (MAPHIEU)
go

alter table THANHTOAN
   add constraint FK_THANHTOA_THU_TIEN_TAIKHOAN foreign key (MATK_THUNGAN)
      references TAIKHOAN (MATK)
go

