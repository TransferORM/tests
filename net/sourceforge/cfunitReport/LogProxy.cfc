����  -T 
SourceFile ?D:\wwwroot\cfunit\src\net\sourceforge\cfunitReport\LogProxy.cfc 0cfLogProxy2ecfc764214523$funcGENERATEXMLTESTDATA  coldfusion/runtime/UDFMethod  <init> ()V  
  	 this 2LcfLogProxy2ecfc764214523$funcGENERATEXMLTESTDATA; LocalVariableTable Code 	ARGUMENTS  bindInternal C(Ljava/lang/String;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  XML  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   LINE  coldfusion/runtime/CfJspPage   pageContext #Lcoldfusion/runtime/NeoPageContext; " #	 ! $ getOut ()Ljavax/servlet/jsp/JspWriter; & ' javax/servlet/jsp/PageContext )
 * ( parent Ljavax/servlet/jsp/tagext/Tag; , -	 ! . LOG 0 LogFile 2 getVariable  (I)Lcoldfusion/runtime/Variable; 4 5 %coldfusion/runtime/ArgumentCollection 7
 8 6 _validateArg a(Ljava/lang/String;ZLjava/lang/String;Lcoldfusion/runtime/Variable;)Lcoldfusion/runtime/Variable; : ;
  < putVariable  (Lcoldfusion/runtime/Variable;)V > ?
  @ ID B 
		
		 D _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V F G
 ! H   J set (Ljava/lang/Object;)V L M coldfusion/runtime/Variable O
 P N 
		 R 
				
		
		 T #class$coldfusion$tagext$lang$XmlTag Ljava/lang/Class; coldfusion.tagext.lang.XmlTag X forName %(Ljava/lang/String;)Ljava/lang/Class; Z [ java/lang/Class ]
 ^ \ V W	  ` _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; b c
 ! d coldfusion/tagext/lang/XmlTag f xml h setVariable (Ljava/lang/String;)V j k
 g l 
doStartTag ()I n o
 g p 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; r s
 ! t :
			<?xml version="1.0" encoding="utf-8"?>
			<tests>
				 v write x k java/io/Writer z
 { y $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag ~ } W	  � coldfusion/tagext/io/OutputTag �
 � p 
					 �  NOT #arguments.log.isLastLine()# � prepareCondition &(Ljava/lang/String;)Ljava/lang/Object; � � coldfusion/runtime/CFPage �
 � � 
						 � java/lang/String � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 ! � getLine � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 ! � 
						
						 � CFUNITID � _resolveAndAutoscalarize � �
 ! � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 ! � 
							<test>
								<id> � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � </id>
								<threadid> � THREADID � *</threadid>
								<application><![CDATA[ � APPLICATION � "]]></application>
								<status> � STATUS � </status>
								<counters> � COUNTS � </counters>
								<date> � DATE � </date>
								<time> � TIME � "</time>
								<message><![CDATA[ � MESSAGE � #]]></message>
							</test>
						 � nextLine � CFLOOP � checkRequestTimeout � k
 ! � evaluateCondition (Ljava/lang/Object;)Z � �
 � � 
				 � doAfterBody � o
 � � doEndTag � o coldfusion/tagext/QueryLoop �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � 
			</tests>
		 �
 g � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
 ! �
 g �
 g �
 g � _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 ! � 
		
	 � generateXMLTestData � metaData Ljava/lang/Object; � �	   public false &coldfusion/runtime/AttributeCollection name access
 output 
returntype 
Parameters REQUIRED yes TYPE NAME log ([Ljava/lang/Object;)V 
 id 	getOutput ()Ljava/lang/String; getReturnType getName runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value 	ARGUMENTS Lcoldfusion/runtime/Variable; THIS XML LINE LOG ID xml11 Lcoldfusion/tagext/lang/XmlTag; mode11 I output10  Lcoldfusion/tagext/io/OutputTag; mode10 t18 t19 t20 Ljava/lang/Throwable; t21 t22 t23 t24 t25 t26 t27 t28 LineNumberTable java/lang/ThrowableL <clinit> 	getAccess getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       V W    } W    � �   	        #     *� 
�                !"     "     �                #"     !     i�                $"     !     ��                %&    �    :+� :+,� :	+� :
+� :-� %� +:-� /:*13� 9� =:+� A*C� 9� =:+� A-E� IK� Q-S� I
K� Q-U� I-� a� e� g:i� m� qY6�F-� u:w� |-� �� e� �:� �Y6��-�� I�� �:��-�� I--� �Y1S� ��� �� �� Q-�� I-� �Y�S� �-� �YCS� �� ��~�� ��� |-� �Y�S� �� �� |�� |-� �Y�S� �� �� |�� |-� �Y�S� �� �� |�� |-� �Y�S� �� �� |�� |-� �Y�S� �� �� |ö |-� �Y�S� �� �� |Ƕ |-� �Y�S� �� �� |˶ |-� �Y�S� �� �� |϶ |-�� I--� �Y1S� ��� �� �� Q-�� IӸ �-� ښ�x-ܶ I� ߚ�V� �� :� )� L� ��� � #:� � � :� �:� ��� |� ��� � :� �:-� �:�� �� :� #�� � #:� �� � :� �:� ��-E� I-
� ��-�� I�  ���M ���   ���   ��M �
      $   :      :'(   :) �   :*+   :,-   :./   :0 �   : , -   :12   :32 	  :42 
  :52   :62   :72   :89   ::;   :<=   :>;   :? �   :@ �   :AB   :CB   :D �   :EB   :F �   :G �   :HB   :IB   :J � K  . K   K C N Y O C N _ P i R g R g R n R x S v S v S } S � V � V � Y � Z � [ � [ � [ � [ [ ]" ] ]= ]F _F _D _[ _d `d `b `y `� a� a� a� a� b� b� b� b� c� c� c� c� d� d� d� d� e� e� e e f f f- f ]4 h> j> j< j< jZ j � Zp k � Y� l � V! n) p) p) n0 p N      �     �Y� _� a� _� ��Y
� �Y	SY�SYSYSYSYSYSYiSYSY	� �Y�Y� �YSYSYSY3SYSYS�SY�Y� �YSY SYSYS�SS���           �     O"     "     �                PQ     -     � �Y1SYCS�                RS     "     ��                     ����  -| 
SourceFile ?D:\wwwroot\cfunit\src\net\sourceforge\cfunitReport\LogProxy.cfc +cfLogProxy2ecfc764214523$funcGETTESTDETAILS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 this -LcfLogProxy2ecfc764214523$funcGETTESTDETAILS; LocalVariableTable Code 	ARGUMENTS  bindInternal C(Ljava/lang/String;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  LOG  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;   !	  " getOut ()Ljavax/servlet/jsp/JspWriter; $ % javax/servlet/jsp/PageContext '
 ( & parent Ljavax/servlet/jsp/tagext/Tag; * +	  , ID . getVariable  (I)Lcoldfusion/runtime/Variable; 0 1 %coldfusion/runtime/ArgumentCollection 3
 4 2 _validateArg a(Ljava/lang/String;ZLjava/lang/String;Lcoldfusion/runtime/Variable;)Lcoldfusion/runtime/Variable; 6 7
  8 putVariable  (Lcoldfusion/runtime/Variable;)V : ;
  < 
		 > _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V @ A
  B   D set (Ljava/lang/Object;)V F G coldfusion/runtime/Variable I
 J H 
		
		 L *coldfusion/runtime/TransientVariableHolder N &(Lcoldfusion/runtime/NeoPageContext;)V  P
 O Q 
			 S 	component U LogFile W CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; Y Z coldfusion/runtime/CFPage \
 ] [ init _ java/lang/Object a D:\CFusionMX7\logs\CFUnit.log c _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; e f
  g 
		
			 i 'class$coldfusion$tagext$lang$SettingTag Ljava/lang/Class; !coldfusion.tagext.lang.SettingTag m forName %(Ljava/lang/String;)Ljava/lang/Class; o p java/lang/Class r
 s q k l	  u _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; w x
  y !coldfusion/tagext/lang/SettingTag { 	cfsetting } enablecfoutputonly  true � _boolean (Ljava/lang/String;)Z � � coldfusion/runtime/Cast �
 � � _validateTagAttrValue ((Ljava/lang/String;Ljava/lang/String;Z)Z � �
  � setEnablecfoutputonly (Z)V � �
 | � showdebugoutput � false � setShowdebugoutput � �
 | � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
  � &class$coldfusion$tagext$net$ContentTag  coldfusion.tagext.net.ContentTag � � l	  �  coldfusion/tagext/net/ContentTag � 	cfcontent � type � text/xml; utf-8 � J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
  � setType (Ljava/lang/String;)V � �
 � � reset � setReset � �
 � � 	_emptyTag � �
  � 
			
			 � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag � � l	  � coldfusion/tagext/io/OutputTag � 
doStartTag ()I � �
 � � generateXMLTestData � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
  � _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
  � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
  � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � write � � java/io/Writer �
 � � doAfterBody � �
 � � doEndTag � � coldfusion/tagext/QueryLoop �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; � � coldfusion/runtime/NeoException �
 � � t0 [Ljava/lang/String; ANY � � �	  � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I � �
 � � CFCATCH bind '(Ljava/lang/String;Ljava/lang/Object;)V
 O 
				 H<?xml version="1.0" encoding="utf-8"?>
				<tests>
					<error><![CDATA[	 MESSAGE 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; �
  :  DETAIL ]]></error>
				</tests> unbind 
 O 
	 getTestDetails metaData Ljava/lang/Object;	  void! remote# &coldfusion/runtime/AttributeCollection% name' access) output+ 
returntype- 
Parameters/ NAME1 id3 REQUIRED5 yes7 ([Ljava/lang/Object;)V 9
&: 	getOutput ()Ljava/lang/String; getReturnType getName runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value 	ARGUMENTS Lcoldfusion/runtime/Variable; THIS LOG ID t12 ,Lcoldfusion/runtime/TransientVariableHolder; setting0 #Lcoldfusion/tagext/lang/SettingTag; t14 content1 "Lcoldfusion/tagext/net/ContentTag; t16 output2  Lcoldfusion/tagext/io/OutputTag; mode2 I t19 t20 Ljava/lang/Throwable; t21 t22 t23 #Lcoldfusion/runtime/AbortException; t24 Ljava/lang/Exception; __cfcatchThrowable0 output3 mode3 t28 t29 t30 t31 t32 t33 LineNumberTable java/lang/Throwablep !coldfusion/runtime/AbortExceptionr java/lang/Exceptiont <clinit> 	getAccess getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       k l    � l    � l    � �      	        #     *� 
�                <=     !     ��                >=     "     "�                ?=     "     �                @A    :  "  �+� :+,� :	+� :
-� #� ):-� -:*/� 5� 9:+� =-?� C
E� K-M� C� OY-� #� R:-T� C
--VX� ^`� bYdS� h� K-j� C-� v� z� |:~��� �� �� �~��� �� �� �� �� :���-T� C-� �� z� �:���� �� ����� �� �� �� �� :���-�� C-� �� z� �:� �Y6� >-ƶ ��-� bY-
� �SY-� �Y/S� �S� ظ ܶ �� ���� �� :� &�9�� � #:� �� � :� �:� �-T� C�� �:�:� �:� �� �     �           �-� C-� �� z� �:� �Y6� U
� �-� �YS�� ܶ �� �-� �YS�� ܶ �� �� ���� �� :� &� H�� � #:� �� � :� �:� �-T� C� �� � : �  �:!��!-� C� 0��q0��   d��s d��u
|�q
��   d��      V "  �      �BC   �D   �EF   �GH   �IJ   �K   � * +   �LM   �NM 	  �OM 
  �PM   �QR   �ST   �U   �VW   �X   �YZ   �[\   �]   �^_   �`_   �a   �bc   �de   �f_   �gZ   �h\   �i   �j_   �k_   �l   �m_    �n !o   � 0    :  :  @  J  H  H  O  d  p  r  o    n  n  l  l  �  � 	 � 	 � 	 � 	 � 
 � 
 � 
 
= L U = = ; ! � �     6 @ @ > W � �  W �  v      �     �n� t� v�� t� ��� t� �� �Y�S� ��&Y
� bY(SYSY*SY$SY,SY�SY.SY"SY0SY	� bY�&Y� bY2SY4SY6SY8S�;SS�;� �           �     w=     "     $�                xy     (     
� �Y/S�           
     z{     "     � �                     ����  -J 
SourceFile ?D:\wwwroot\cfunit\src\net\sourceforge\cfunitReport\LogProxy.cfc -cfLogProxy2ecfc764214523$funcGENERATEXMLTESTS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 this /LcfLogProxy2ecfc764214523$funcGENERATEXMLTESTS; LocalVariableTable Code 	ARGUMENTS  bindInternal C(Ljava/lang/String;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  LASTID  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   XML  LINE   coldfusion/runtime/CfJspPage " pageContext #Lcoldfusion/runtime/NeoPageContext; $ %	 # & getOut ()Ljavax/servlet/jsp/JspWriter; ( ) javax/servlet/jsp/PageContext +
 , * parent Ljavax/servlet/jsp/tagext/Tag; . /	 # 0 LOG 2 LogFile 4 getVariable  (I)Lcoldfusion/runtime/Variable; 6 7 %coldfusion/runtime/ArgumentCollection 9
 : 8 _validateArg a(Ljava/lang/String;ZLjava/lang/String;Lcoldfusion/runtime/Variable;)Lcoldfusion/runtime/Variable; < =
  > putVariable  (Lcoldfusion/runtime/Variable;)V @ A
  B 
		
		 D _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V F G
 # H   J set (Ljava/lang/Object;)V L M coldfusion/runtime/Variable O
 P N 
		 R 
				
		
		 T #class$coldfusion$tagext$lang$XmlTag Ljava/lang/Class; coldfusion.tagext.lang.XmlTag X forName %(Ljava/lang/String;)Ljava/lang/Class; Z [ java/lang/Class ]
 ^ \ V W	  ` _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; b c
 # d coldfusion/tagext/lang/XmlTag f xml h setVariable (Ljava/lang/String;)V j k
 g l 
doStartTag ()I n o
 g p 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; r s
 # t :
			<?xml version="1.0" encoding="utf-8"?>
			<tests>
				 v write x k java/io/Writer z
 { y $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag ~ } W	  � coldfusion/tagext/io/OutputTag �
 � p 
					 �  NOT #arguments.log.isLastLine()# � prepareCondition &(Ljava/lang/String;)Ljava/lang/Object; � � coldfusion/runtime/CFPage �
 � � 
						 � java/lang/String � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 # � getLine � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 # � 
						
						 � _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 # � CFUNITID � _resolveAndAutoscalarize � �
 # � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 # � 
							<test>
								<id> � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � </id>
								<status> � STATUS � </status>
								<application> � APPLICATION � !</application>
								<counters> � COUNTS � </counters>
								<time> � DATE �   � TIME � </time>
							</test>
							 � nextLine � CFLOOP � checkRequestTimeout � k
 # � evaluateCondition (Ljava/lang/Object;)Z � �
 � � 
				 � doAfterBody � o
 � � doEndTag � o coldfusion/tagext/QueryLoop �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � 
			</tests>
		 �
 g � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
 # �
 g �
 g �
 g � 
		
	 � generateXMLTests � metaData Ljava/lang/Object; � �	  � public � false � &coldfusion/runtime/AttributeCollection � name  access output 
returntype 
Parameters REQUIRED
 yes TYPE NAME log ([Ljava/lang/Object;)V 
 � 	getOutput ()Ljava/lang/String; getReturnType getName runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value 	ARGUMENTS Lcoldfusion/runtime/Variable; THIS LASTID XML LINE LOG xml9 Lcoldfusion/tagext/lang/XmlTag; mode9 I output8  Lcoldfusion/tagext/io/OutputTag; mode8 t18 t19 t20 Ljava/lang/Throwable; t21 t22 t23 t24 t25 t26 t27 t28 LineNumberTable java/lang/ThrowableB <clinit> 	getAccess getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       V W    } W    � �   	        #     *� 
�                     !     ��                     !     i�                     !     ��                    �    +� :+,� :	+� :
+� :+!� :-� '� -:-� 1:*35� ;� ?:+� C-E� I
K� Q-S� IK� Q-S� IK� Q-U� I-� a� e� g:i� m� qY6�-� u:w� |-� �� e� �:� �Y6��-�� I�� �:�[-�� I--� �Y3S� ��� �� �� Q-�� I-
� �-� �Y�S� �� ��~� ��� |-� �Y�S� �� �� |�� |-� �Y�S� �� �� |�� |-� �Y�S� �� �� |�� |-� �Y�S� �� �� |ö |-� �Y�S� �� �� |-Ƕ I-� �Y�S� �� �� |˶ |
-� �Y�S� �� Q-�� I-�� I--� �Y3S� ��� �� �� Q-�� Iϸ �-� ֚��-ض I� ۚ��� �� :� )� L� ��� � #:� � � :� �:� �� |� ��� � :� �:-� �:�� �� :� #�� � #:� � � :� �:� �-E� I-� ��-� I�  �ouC �~�   ���   ���C ���      $             �    !   "#   $%   & �    . /   '(   )( 	  *( 
  +(   ,(   -(   ./   01   23   41   5 �   6 �   78   98   : �   ;8   < �   = �   >8   ?8   @ � A  . K   ' K ) K ) Q * [ , Y , Y , ` , j - h - h - o - y . w . w . ~ . � 1 � 1 � 4 � 5 � 6 � 6 � 6 � 6 6 8 8 83 8< :< :: :Q :Z ;Z ;X ;o ;x <x <v <� <� =� =� =� =� >� >� >� >� >� >� >� >� @� @� @� @ @ 8 A C C C C1 C � 5G D � 4� E � 1� G  I  I  G I D      �     �Y� _� a� _� �� �Y
� �YSY�SYSY�SYSY�SYSYiSY	SY	� �Y� �Y� �YSYSYSY5SYSYS�SS�� ��           �     E     !     ��                FG     (     
� �Y3S�           
     HI     "     � ��                     ����  -` 
SourceFile ?D:\wwwroot\cfunit\src\net\sourceforge\cfunitReport\LogProxy.cfc %cfLogProxy2ecfc764214523$funcGETTESTS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 this 'LcfLogProxy2ecfc764214523$funcGETTESTS; LocalVariableTable Code 	ARGUMENTS  bindInternal C(Ljava/lang/String;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  LOG  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;   !	  " getOut ()Ljavax/servlet/jsp/JspWriter; $ % javax/servlet/jsp/PageContext '
 ( & parent Ljavax/servlet/jsp/tagext/Tag; * +	  , 	
		 . _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 0 1
  2   4 set (Ljava/lang/Object;)V 6 7 coldfusion/runtime/Variable 9
 : 8 
		
		 < *coldfusion/runtime/TransientVariableHolder > &(Lcoldfusion/runtime/NeoPageContext;)V  @
 ? A 
			 C 	component E LogFile G CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; I J coldfusion/runtime/CFPage L
 M K init O java/lang/Object Q D:\CFusionMX7\logs\CFUnit.log S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
  W 
		
			 Y 'class$coldfusion$tagext$lang$SettingTag Ljava/lang/Class; !coldfusion.tagext.lang.SettingTag ] forName %(Ljava/lang/String;)Ljava/lang/Class; _ ` java/lang/Class b
 c a [ \	  e _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; g h
  i !coldfusion/tagext/lang/SettingTag k 	cfsetting m enablecfoutputonly o true q _boolean (Ljava/lang/String;)Z s t coldfusion/runtime/Cast v
 w u _validateTagAttrValue ((Ljava/lang/String;Ljava/lang/String;Z)Z y z
  { setEnablecfoutputonly (Z)V } ~
 l  showdebugoutput � false � setShowdebugoutput � ~
 l � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
  � &class$coldfusion$tagext$net$ContentTag  coldfusion.tagext.net.ContentTag � � \	  �  coldfusion/tagext/net/ContentTag � 	cfcontent � type � text/xml; utf-8 � J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; y �
  � setType (Ljava/lang/String;)V � �
 � � reset � setReset � ~
 � � 	_emptyTag � �
  � 
			
			 � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag � � \	  � coldfusion/tagext/io/OutputTag � 
doStartTag ()I � �
 � � generateXMLTests � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
  � _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
  � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 w � write � � java/io/Writer �
 � � doAfterBody � �
 � � doEndTag � � coldfusion/tagext/QueryLoop �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; � � coldfusion/runtime/NeoException �
 � � t0 [Ljava/lang/String; java/lang/String � ANY � � �	  � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I � �
 � � CFCATCH � bind '(Ljava/lang/String;Ljava/lang/Object;)V � �
 ? � 
				 � H<?xml version="1.0" encoding="utf-8"?>
				<tests>
					<error><![CDATA[ � MESSAGE � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � :  � DETAIL � ]]></error>
				</tests> unbind 
 ? 
	 getTests metaData Ljava/lang/Object;
	  void remote &coldfusion/runtime/AttributeCollection name access output 
returntype 
Parameters ([Ljava/lang/Object;)V 
 	getOutput ()Ljava/lang/String; getReturnType getName runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value 	ARGUMENTS Lcoldfusion/runtime/Variable; THIS LOG t11 ,Lcoldfusion/runtime/TransientVariableHolder; setting4 #Lcoldfusion/tagext/lang/SettingTag; t13 content5 "Lcoldfusion/tagext/net/ContentTag; t15 output6  Lcoldfusion/tagext/io/OutputTag; mode6 I t18 t19 Ljava/lang/Throwable; t20 t21 t22 #Lcoldfusion/runtime/AbortException; t23 Ljava/lang/Exception; __cfcatchThrowable1 output7 mode7 t27 t28 t29 t30 t31 t32 LineNumberTable java/lang/ThrowableT !coldfusion/runtime/AbortExceptionV java/lang/ExceptionX <clinit> 	getAccess getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       [ \    � \    � \    � �   
   	        #     *� 
�                !"     !     r�                #"     "     �                $"     "     	�                %&    � 	 !  �+� :+,� :	+� :
-� #� ):-� -:-/� 3
5� ;-=� 3� ?Y-� #� B:-D� 3
--FH� NP� RYTS� X� ;-Z� 3-� f� j� l:npr� x� |� �n��� x� |� �� �� :���-D� 3-� �� j� �:���� �� ���r� x� |� �� �� :���-�� 3-� �� j� �:� �Y6� ,-�� ��-� RY-
� �S� ¸ ƶ �� Κ��� �� :� &�2�� � #:� ר � :� �:� ک-D� 3� �� �:�:� �:� � �     �           �� �-�� 3-� �� j� �:� �Y6� P�� �-�� �Y�S� �� ƶ ��� �-�� �Y S� �� ƶ �� �� Κ��� �� :� &� H�� � #:� ר � :� �:� ک-D� 3� �� � :� �: �� -� 3� ciUrx   N��W N��Y�MSU�\b   N��      L !  �      �'(   �)   �*+   �,-   �./   �0   � * +   �12   �32 	  �42 
  �56   �78   �9   �:;   �<   �=>   �?@   �A   �BC   �DC   �E   �FG   �HI   �JC   �K>   �L@   �M   �NC   �OC   �P   �QC   �R  S   � .    *  *  4  2  2  9  N  Z  \  Y  i  X  X  V  V  r  �  �  z  �  �  �  �  ' 6 ' ' %  � �  � !� #� #� #	 # # # #( #� !s $ A � & Z      �     t^� d� f�� d� ��� d� �� �Y�S� �Y
� RYSY	SYSYSYSYrSYSYSYSY	� RS� ��           t     ["     "     �                \]     #     � �                ^_     "     ��                     ����  - s 
SourceFile ?D:\wwwroot\cfunit\src\net\sourceforge\cfunitReport\LogProxy.cfc cfLogProxy2ecfc764214523  coldfusion/runtime/CFComponent  <init> ()V  
  	 this LcfLogProxy2ecfc764214523; LocalVariableTable Code com.macromedia.SourceModTime  ���� coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   javax/servlet/jsp/PageContext 
   parent Ljavax/servlet/jsp/tagext/Tag;  	    
	 " _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V $ %
  & 
	
	 ( 
	
	
	 * 
	
 , generateXMLTestData Lcoldfusion/runtime/UDFMethod; 0cfLogProxy2ecfc764214523$funcGENERATEXMLTESTDATA 0
 1 	 . /	  3 generateXMLTestData 5 registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V 7 8
  9 getTestDetails +cfLogProxy2ecfc764214523$funcGETTESTDETAILS <
 = 	 ; /	  ? getTestDetails A getTests %cfLogProxy2ecfc764214523$funcGETTESTS D
 E 	 C /	  G getTests I generateXMLTests -cfLogProxy2ecfc764214523$funcGENERATEXMLTESTS L
 M 	 K /	  O generateXMLTests Q metaData Ljava/lang/Object; S T	  U &coldfusion/runtime/AttributeCollection W java/lang/Object Y name [ LogProxy ] Name _ 	Functions a	 1 U	 = U	 E U	 M U ([Ljava/lang/Object;)V  g
 X h runPage ()Ljava/lang/Object; out Ljavax/servlet/jsp/JspWriter; value LineNumberTable <clinit> getMetadata registerUDFs 1       . /    ; /    C /    K /    S T           #     *� 
�                 j k     �     2*� � L*� !N*+#� '*+)� '*+)� '*++� '*+-� '�       *    2       2 l m    2 n T    2    o          ' " K ) r     p      � 	    p� 1Y� 2� 4� =Y� >� @� EY� F� H� MY� N� P� XY� ZY\SY^SY`SY^SYbSY� ZY� cSY� dSY� eSY� fSS� i� V�           p     o     R K X  ^  d '  q k     "     � V�                 r      C     %*6� 4� :*B� @� :*J� H� :*R� P� :�           %               