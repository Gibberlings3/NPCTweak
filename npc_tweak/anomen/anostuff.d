/*
 * Dialogues for NPCTweak Anomen Component.
 * Code thanks to CamDawg.
 * See the file 'COPYING' for copyright information.
 */

/* Cor taking his stuff back after disowning Anomen. */
ADD_TRANS_ACTION COR
BEGIN 24 END // 24 = Anomen being disowned.
BEGIN END
~TakePartyItemAll("ANOHELM") TakePartyItemAll("NPSHLD")~

/* Prelate whatshisname giving Anomen the armour. */
EXTEND_BOTTOM HPRELATE 5 // 5 = Sir Anomen arising as a knight.
	IF ~~ THEN DO ~SetGlobal("AnomenIsKnight","GLOBAL",1)~ GOTO g3newprelate
END

APPEND HPRELATE
IF ~~ THEN BEGIN g3newprelate SAY ~You are granted this armor, with which to serve.~
	IF ~~ THEN DO ~GiveItemCreate("ANOPLAT", "Anomen", 0, 0, 0)~ EXTERN ANOMENJ 97
END
END

/* 
 * Messenger taking Cor's stuff back. Cheesy dialogue left in because it was
 * recommended I take it out.
 */
BEGIN G3OSMSGR
IF ~True()~ THEN BEGIN G3OSGimmeThat SAY ~Those items are the property of Cor Delryn and he demands their return, as is his right under Amnish law.~
  IF ~~ THEN DO ~TakePartyItemAll("ANOHELM")
                 TakePartyItemAll("NPSHLD")~ GOTO G3OSGimmeThat2
END                

IF ~~ THEN BEGIN G3OSGimmeThat2 SAY ~Thank you for your cooperation citizen.~
  IF ~~ THEN EXIT
END
