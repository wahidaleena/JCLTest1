//SJCL JOB (SAMP),CLASS=9,
//				MSGCLASS=A,MSGLEVEL=(1,1),
//    		    NOTIFY=&SYSUID
//**
//			SET CC=Z4.
//			SET CC1=Z4
//			SET IRLMID=IRL2
//			SET DB2ID=DSNT
//			SET DBCTLID=D2
//			SET I18NLIB=WM.SP.PARMLIB
//			SET I18NMBR=DUMMY
//*
//JOBLIB	DD DSN=WM.&CC.LINKLIB,DISP=SHR
//			DD DSN=WM.TESTLINK , DISP=SHR 						
//			DD DSN=WM.SP.LINKLIB,DISP=SHR
//
//*
//LIBSRCH 	JCLLIB ORDER=(WM.SP.APPLIC.PROCLIB,
//				WM.&CC.DBA.PROCLIB,
//				WM.SP.DBA.PROCLIB,
//				WM.PROCLIB,
//				N01.&CC.FIN.JOB.RESOURCE,
//				N01.Z4.STORELOC)
//*
//CA7DMY EXEC PGM=IEFBR14
//******************************************************************************
//* STEP01 - IEFBR14- DELETE WORK FILE										   
//*----------------------------------------------------------------------------*
//STEP01  EXEC PGM=IEFBR14
//DD1	  DD DSN=N01.Z4.STORELOC.OUT,DISP=(MOD,DELETE,DELETE),
//		   SPACE=(0,0)
//*----------------------------------------------------------------------------
//STEP02   EXEC DB2TSOP,MBR=SAMPLE,
//				JOB=DB2JCL,STEP=02,
//				PLN=Z4BTCHSA, SYS=DSNT
//INFILE 	DD DSN=N01.Z4.STORELOC.IN,DISP=SHR
//OUTPUT	DD DSN=N01.Z4.STORELOC.OUT,DISP=(,CATLG,DELETE),
//			    LRECL=32,RECFM=FB,
//			    SPACE=(CYL,(1200,500)),
//			    DSORG=PS ,AVGREC=K
//TELLOP02 EXEC PGM=TELLOP,COND=(0,EQ,STEP02.DB2)			
//	
//	
//	
//	
//	
//	
//	
