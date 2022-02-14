create or replace package regix_registers is

  -- Author  : KKALOYANOV
  -- Created : 18.10.2021 13:37:21
  -- Purpose : 
  /**
  * 1.	Адаптер „Уведомления“
  *
  *  a.Справка за предприятие
  *    Параметри на справката: 
  *  	  Наименование
  *  	  Тип
  *	    ЕИК
  *	    Адрес
  *	    Интернет страница
  *
  */
  procedure get_notification_company(p_company_name  IN varchar2, 
                                     p_company_type    IN varchar2, 
                                     p_company_EIK     IN varchar2, 
                                     p_company_address IN varchar2, 
                                     p_company_web     IN varchar2, 
                                     p_out_notifications OUT SYS_REFCURSOR 
                                     );
  /**
  *b.	Справка по мрежа/услуга
  *Параметри:
  *	Описание на мрежата/услугата
  *	гр./с.	
  *	Наименование	
  *	Община	
  *	Област
  *	Дата на възникване на правата - от дата - до дата
  *
  */
  procedure get_notification_net_services( p_net_sev_description  IN varchar2, 
                                           p_city_abreviation     IN varchar2, 
                                           p_city                 IN varchar2, 
                                           p_municipality         IN varchar2, 
                                           p_district             IN varchar2, 
                                           p_from_date            IN date,
                                           p_to_date              IN date,
                                           p_out_notifications OUT SYS_REFCURSOR 
                                           );
  /**
  * 2.	Адаптер „Брой крайни ползватели“
  *   a.	Справка за предприятие
  * Параметри на справката:
  * 	Наименование
  *	  Тип
  *	  ЕИК
  */                                           
  procedure get_number_end_users(p_company_name  IN varchar2, 
                                 p_company_type    IN varchar2, 
                                 p_company_EIK     IN varchar2, 
                                 p_out_records OUT SYS_REFCURSOR 
                                 );

  /**
  * 3.	Адаптер „Радиочестотен спектър“
  *  	Наименование
  *  	Тип
  *  	ЕИК
  *  	Адрес
  *  	Интернет страница
  *  	Номер на разрешение
  *  	Дата на издаване – от дата – до дата
  *  	Крайна дата на действие – от дата – до дата
  *  	Радиослужба
  */
  procedure get_radio_nets(p_company_name     IN varchar2, 
                           p_company_type     IN varchar2, 
                           p_company_EIK      IN varchar2, 
                           p_company_address  IN varchar2, 
                           p_company_web      IN varchar2, 
                           p_permtion_no      In varchar2,
                           p_from_date_issue  IN date,
                           p_to_date_issue    IN date,
                           p_from_date_action IN date,
                           p_to_date_action   IN date,
                           p_radio_service    IN varchar2, 
                           p_out_records OUT SYS_REFCURSOR 
                           );
  /**
  *4.	Адаптер „Позиция на геостационарна орбита“
  *    •	Наименование
  *    •	Тип
  *    •	ЕИК
  *    •	Адрес
  *    •	Интернет страница
  *    •	Номер на разрешение
  *    •	Дата на издаване – от дата – до дата
  *    •	Крайна дата на действие – от дата – до дата
  *
  */                           
  procedure get_geo_stat(p_company_name     IN varchar2, 
                         p_company_type     IN varchar2, 
                         p_company_EIK      IN varchar2, 
                         p_company_address  IN varchar2, 
                         p_company_web      IN varchar2, 
                         p_permition_no     IN varchar2,
                         p_from_date_issue  IN date,
                         p_to_date_issue    IN date,
                         p_from_date_action IN date,
                         p_to_date_action   IN date,
                         p_out_records OUT SYS_REFCURSOR 
                         );
                         
  /**
  *  5.	Адаптер „Номера“
  *     Параметри на справката:
  *   •	Наименование
  *   •	Тип
  *   •	ЕИК
  *   •	Адрес
  *   •	Интернет страница
  *   •	Номер на разрешение
  *   •	Дата на издаване – от дата – до дата
  */                         
  procedure get_numbers( p_company_name     IN varchar2, 
                         p_company_type     IN varchar2, 
                         p_company_EIK      IN varchar2, 
                         p_company_address  IN varchar2, 
                         p_company_web      IN varchar2, 
                         p_permition_no     IN varchar2,
                         p_from_date_issue  IN date,
                         p_to_date_issue    IN date,
                         p_out_records OUT SYS_REFCURSOR 
                         );

  /**
  *  6.	Адаптер „Предприятия  със  значително въздействие“
  *     Параметри на справката:
  *   •	Наименование
  *   •	Тип
  *   •	ЕИК
  */
  procedure get_market_significant(p_company_name     IN varchar2, 
                                   p_company_type     IN varchar2, 
                                   p_company_EIK      IN varchar2, 
                                   p_out_records OUT SYS_REFCURSOR 
                                   );
  /**
   *  7.	Адаптер „Прехвърлени права“
   *  a.	Справка за прехвърлени права
   *
   *  Параметри на справката:
   *  •	Наименование приобретател
   *  •	Тип
   *  •	Разрешение 
   *  •	Дата на прехвърляне - от дата – до дата
   *  •	Крайна дата на действие - от дата – до дата
   *  •	Наименование праводател
   *  •	Тип
   *  •	Разрешение 
   *  •	Дата на издаване - от дата – до дата
  */                         
  procedure get_transfered(p_receiver_name     IN varchar2, 
                           p_receiver_type     IN varchar2, 
                           p_permition         IN varchar2, 
                           p_transf_date_from  IN date, 
                           p_transf_date_to    IN date, 
                           p_end_date_from  IN date, 
                           p_end_date_to    IN date, 
                           p_giving_name     IN varchar2, 
                           p_giving_type     IN varchar2, 
                           p_permition_g     IN varchar2, 
                           p_issue_date_from  IN date, 
                           p_issue_date_to    IN date, 
                           p_out_records OUT SYS_REFCURSOR 
                           );
  /**
   *  b.	Справка за отдадения под наем радиочестотен спектър
   *  Параметри на справката:
   *  •	Наименование наемодател
   *  •	Тип
   *  •	Разрешение 
   *  •	Дата на издаване - от дата – до дата
   *  •	Крайна дата на действие - от дата – до дата
   *  •	Наименование наемател
   *  •	Тип
   *  •	Решение на КРС
   *  •	Срок на отдаването под наем - от дата – до дата
   */                           
  procedure get_leased(p_giving_name     IN varchar2, 
                       p_giving_type     IN varchar2, 
                       p_permition_g     IN varchar2, 
                       p_issue_date_from  IN date, 
                       p_issue_date_to    IN date, 
                       p_receiver_name     IN varchar2, 
                       p_receiver_type     IN varchar2, 
                       p_permition         IN varchar2, 
                       p_rent_date_from  IN date, 
                       p_rent_date_to    IN date, 
                       p_end_date_from  IN date, 
                       p_end_date_to    IN date, 
                       p_out_records OUT SYS_REFCURSOR 
                       );
  /**
   * 8.	Адаптер „Предоставени номерационни ресурси“
   *       a.	Справка за номера
   *
   *  Параметри на справката:
   *  •	Предприятие
   *  •	Вид
   *  •	Код
   *  •	Група номера
   *  •	Решение 
   *  •	Дата на решение - от дата – до дата
  */
  procedure get_number_resources(p_company_name     IN varchar2, 
                                 p_company_type     IN varchar2, 
                                 p_code             IN varchar2, 
                                 p_group            IN varchar2, 
                                 p_decision         IN varchar2,
                                 p_issue_date_from  IN date, 
                                 p_issue_date_to    IN date, 
                                 p_out_records OUT SYS_REFCURSOR 
                               );

  /**
   * 9.	Адаптер „Универсални пощенски услуги“
   *       Параметри на справката:
   *  •	Титуляр
   *  •	Вид
   *  •	УРИ
   *  •	Адрес
   *  •	Лицензия
   *  •	Дата на лицензия - от дата – до дата
   *  •	Начална дата на действие – от дата – до дата
   *  •	Крайна дата на действие – от дата – до дата
   *  •	Предоставяни услуги(пратки, колети, допълнителни, парични преводи) - стойности "Да" и "Не"
  */
  procedure get_post_universal(p_company_name     IN varchar2, 
                               p_company_type     IN varchar2, 
                               p_uri              IN varchar2, 
                               p_address          IN varchar2, 
                               p_license          IN varchar2,
                               p_issue_date_from  IN date, 
                               p_issue_date_to    IN date, 
                               p_start_date_from  IN date, 
                               p_start_date_to    IN date, 
                               p_end_date_from    IN date, 
                               p_end_date_to      IN date, 
                               p_shipments        IN varchar2,
                               p_parcels          IN varchar2,
                               p_additionals      IN varchar2, 
                               p_transfers        IN varchar2,
                               p_out_records OUT SYS_REFCURSOR 
                               );

  /**
   * 10.	Адаптер „Неуниверсални пощенски услуги“
   *       Параметри на справката:
   *  •	Оператор
   *  •	Вид
   *  •	Адрес
   *  •	Удостоверение
   *  •	Дата на започване - от дата – до дата
   *  •	Обхват на НПУ (съобщения, куриерски услуги, пряка реклама)  - стойности "Да" и "Не"
  */
  procedure get_post_non_universal(p_company_name     IN varchar2, 
                                   p_company_type     IN varchar2, 
                                   p_address          IN varchar2, 
                                   p_license          IN varchar2,
                                   p_issue_date_from  IN date, 
                                   p_issue_date_to    IN date, 
                                   p_shipments        IN varchar2,
                                   p_cour_services    IN varchar2,
                                   p_advertising      IN varchar2, 
                                   p_out_records OUT SYS_REFCURSOR 
                                   );

end regix_registers;
/
create or replace package body regix_registers is

  procedure get_notification_company(p_company_name  IN varchar2, 
                                     p_company_type    IN varchar2, 
                                     p_company_EIK     IN varchar2, 
                                     p_company_address IN varchar2, 
                                     p_company_web     IN varchar2, 
                                     p_out_notifications OUT SYS_REFCURSOR                                     
                                     )
  is
  begin
    open p_out_notifications for
      select 
          -- ЮЛ
          t.UL_NAME,
          t.UL_TYPE,
          t.eik,
          t.web,
          t.UL_ADDRESS||', п.код: '||t.UL_PK||', '||t.UL_GR_SELO||' '||t.UL_NAS_MESTO||', Община:'||t.UL_OBSHTINA||', Област: '||t.UL_OBLAST sedalishte,
          -- лице за контакт
          case when trim(lk.LK_NAME||' '||lk.LK_PREZIME||' '||lk.LK_FAMILIA) is not null then
            lk.LK_NAME||' '||lk.LK_PREZIME||' '||lk.LK_FAMILIA
          else
            null
          end lk_name,
          lk.TEL_KOD,
          lk.TEL tel,
          lk.E_MAIL,
          lk.LK_ADDRESS||', п.код: '||lk.LK_PK||', '||lk.LK_GR_SELO||' '||lk.LK_NAS_MESTO||', Община:'||lk.LK_OBSHTINA||', Област: '||lk.LK_OBLAST LK_ADDRESS,
          -- мрежа
          'net' net_service,
          m.date_nadlejno,
          m.usl_mre_descr,
          m.gr_selo,
          m.nas_mesto,
          m.obshtina,
          m.oblast,
          m.predpolag_data,
          m.data_prekratiavane
          --
          from mv_uvedomlenia_ul t
          left outer join mv_uvedomlenia_lk lk on t.id = lk.ul_id
          join mv_uve_ul_mreji m on m.ul_id = t.id
          where (t.ul_name = p_company_name or p_company_name is null)
            and (t.ul_type = p_company_type or p_company_type is null)
            and (t.eik = p_company_EIK or p_company_EIK is null)
            and (t.web = p_company_address or p_company_address is null)
            and (t.web = p_company_web or p_company_web is null)
      union all
      select 
          t.UL_NAME,
          t.UL_TYPE,
          t.eik,
          t.web,
          t.UL_ADDRESS||', п.код: '||t.UL_PK||', '||t.UL_GR_SELO||' '||t.UL_NAS_MESTO||', Община:'||t.UL_OBSHTINA||', Област: '||t.UL_OBLAST sedalishte,
          case when trim(lk.LK_NAME||' '||lk.LK_PREZIME||' '||lk.LK_FAMILIA) is not null then
            lk.LK_NAME||' '||lk.LK_PREZIME||' '||lk.LK_FAMILIA
          else
            null
          end lk_name,
          lk.TEL_KOD,
          lk.TEL tel,
          lk.E_MAIL,
          lk.LK_ADDRESS||', п.код: '||lk.LK_PK||', '||lk.LK_GR_SELO||' '||lk.LK_NAS_MESTO||', Община:'||lk.LK_OBSHTINA||', Област: '||lk.LK_OBLAST LK_ADDRESS,
          -- услуга
          'service' net_service,
          u.date_nadlejno,
          u.usl_mre_descr,
          u.gr_selo,
          u.nas_mesto,
          u.obshtina,
          u.oblast,
          u.predpolag_data,
          u.data_prekratiavane
          --
          from mv_uvedomlenia_ul t
          left outer join mv_uvedomlenia_lk lk on t.id = lk.ul_id
          join mv_uve_ul_uslugi u on u.ul_id = t.id
          where (t.ul_name = p_company_name or p_company_name is null)
            and (t.ul_type = p_company_type or p_company_type is null)
            and (t.eik = p_company_EIK or p_company_EIK is null)
            and (t.ul_address = p_company_address or p_company_address is null)
            and (t.web = p_company_web or p_company_web is null);
  end get_notification_company;
--
  procedure get_notification_net_services( p_net_sev_description  IN varchar2, 
                                           p_city_abreviation     IN varchar2, 
                                           p_city                 IN varchar2, 
                                           p_municipality         IN varchar2, 
                                           p_district             IN varchar2, 
                                           p_from_date            IN date,
                                           p_to_date              IN date,
                                           p_out_notifications OUT SYS_REFCURSOR 
                                           )
  is
  begin
    open p_out_notifications for
      select 
          -- ЮЛ
          t.UL_NAME,
          t.UL_TYPE,
          t.eik,
          t.web,
          t.UL_ADDRESS||', п.код: '||t.UL_PK||', '||t.UL_GR_SELO||' '||t.UL_NAS_MESTO||', Община:'||t.UL_OBSHTINA||', Област: '||t.UL_OBLAST sedalishte,
          -- лице за контакт
          case when trim(lk.LK_NAME||' '||lk.LK_PREZIME||' '||lk.LK_FAMILIA) is not null then
            lk.LK_NAME||' '||lk.LK_PREZIME||' '||lk.LK_FAMILIA
          else
            null
          end lk_name,
          lk.TEL_KOD,
          lk.TEL tel,
          lk.E_MAIL,
          lk.LK_ADDRESS||', п.код: '||lk.LK_PK||', '||lk.LK_GR_SELO||' '||lk.LK_NAS_MESTO||', Община:'||lk.LK_OBSHTINA||', Област: '||lk.LK_OBLAST LK_ADDRESS,
          -- мрежа
          'net' net_service,
          m.date_nadlejno,
          m.usl_mre_descr,
          m.gr_selo,
          m.nas_mesto,
          m.obshtina,
          m.oblast,
          m.predpolag_data,
          m.data_prekratiavane
          --
          from mv_uvedomlenia_ul t
          left outer join mv_uvedomlenia_lk lk on t.id = lk.ul_id
          join mv_uve_ul_mreji m on m.ul_id = t.id
          where (m.usl_mre_descr = p_net_sev_description or p_net_sev_description is null)
            and (m.gr_selo = p_city_abreviation or p_city_abreviation is null)
            and (m.nas_mesto = p_city or p_city is null)
            and (m.obshtina = p_municipality or p_municipality is null)
            and (m.oblast = p_district or p_district is null)
            and (m.date_nadlejno >= p_from_date or p_from_date is null)
            and (m.date_nadlejno <= p_to_date or p_to_date is null)
      union all
      select 
          t.UL_NAME,
          t.UL_TYPE,
          t.eik,
          t.web,
          t.UL_ADDRESS||', п.код: '||t.UL_PK||', '||t.UL_GR_SELO||' '||t.UL_NAS_MESTO||', Община:'||t.UL_OBSHTINA||', Област: '||t.UL_OBLAST sedalishte,
          case when trim(lk.LK_NAME||' '||lk.LK_PREZIME||' '||lk.LK_FAMILIA) is not null then
            lk.LK_NAME||' '||lk.LK_PREZIME||' '||lk.LK_FAMILIA
          else
            null
          end lk_name,
          lk.TEL_KOD,
          lk.TEL tel,
          lk.E_MAIL,
          lk.LK_ADDRESS||', п.код: '||lk.LK_PK||', '||lk.LK_GR_SELO||' '||lk.LK_NAS_MESTO||', Община:'||lk.LK_OBSHTINA||', Област: '||lk.LK_OBLAST LK_ADDRESS,
          -- услуга
          'service' net_service,
          u.date_nadlejno,
          u.usl_mre_descr,
          u.gr_selo,
          u.nas_mesto,
          u.obshtina,
          u.oblast,
          u.predpolag_data,
          u.data_prekratiavane
          --
          from mv_uvedomlenia_ul t
          left outer join mv_uvedomlenia_lk lk on t.id = lk.ul_id
          join mv_uve_ul_uslugi u on u.ul_id = t.id
          where (u.usl_mre_descr = p_net_sev_description or p_net_sev_description is null)
            and (u.gr_selo = p_city_abreviation or p_city_abreviation is null)
            and (u.nas_mesto = p_city or p_city is null)
            and (u.obshtina = p_municipality or p_municipality is null)
            and (u.oblast = p_district or p_district is null)
            and (u.date_nadlejno >= p_from_date or p_from_date is null)
            and (u.date_nadlejno <= p_to_date or p_to_date is null);
  end get_notification_net_services;
--
  procedure get_number_end_users(p_company_name  IN varchar2, 
                                 p_company_type    IN varchar2, 
                                 p_company_EIK     IN varchar2, 
                                 p_out_records OUT SYS_REFCURSOR 
                                 )
  is
  begin
    open p_out_records for
          select  pr_name,  -- предприятие 
                  pr_type, -- вид
                  pr_eik,  -- ЕИК
                  info, -- предоставена информация да/не
                  declar, -- декларира дейнст да/не
                  fics_tel, -- фиксирана телефонна услуга
                  obsht_tel_oper, -- достъп до обществена тел. услуга
                  mobil_tel, -- мобилна тел. услуга
                  usl_internet, -- интернет
                  usl_mobil, -- мобилен интернет
                  usl_data, -- пренос данни
                  rado_tv  -- радио и ТВ 
          from mv_abonaty
          where (pr_name = p_company_name or p_company_name is null)
            and (pr_type = p_company_type or p_company_type is null)
            and (pr_eik = p_company_EIK or p_company_EIK is null);
  end get_number_end_users;
--
  procedure get_radio_nets(p_company_name     IN varchar2, 
                           p_company_type     IN varchar2, 
                           p_company_EIK      IN varchar2, 
                           p_company_address  IN varchar2, 
                           p_company_web      IN varchar2, 
                           p_permtion_no      In varchar2,
                           p_from_date_issue  IN date,
                           p_to_date_issue    IN date,
                           p_from_date_action IN date,
                           p_to_date_action   IN date,
                           p_radio_service    IN varchar2, 
                           p_out_records OUT SYS_REFCURSOR 
                           )
                             is
  begin
    open p_out_records for
          select net_type
               , ul.ul_name
               , ul.ul_type
               , ul.eik
               , ul.ul_address
               , ul.web
               , vh_nomer
               , vh_data
               , data_nach
               , data_prik
               , prednaznach
               , gr_selo
               , nas_mesto
               , oblast
               , dolna_gra
               , gorna_gra
               , rab_kanal
               , chestot_obhvat
               , ddescription
               , broy
               , broi_blokove
               , obshto_spektar
               , network_type
               , chest_lenta
               , nose_chestota
               , terit_obhvat  
               , mestopol
               , ches_predav
               , ches_len_predav
               , ches_len_priem 
               , status
          from mv_ioor_all_regix t
          join mv_ioor_radioches_ul ul on t.id = ul.id
          where (ul.ul_name = p_company_name or p_company_name is null)
            and (ul.ul_type = p_company_type or p_company_type is null)
            and (ul.eik = p_company_EIK or p_company_EIK is null)
            and (ul.ul_address = p_company_address or p_company_address is null)
            and (ul.web = p_company_web or p_company_web is null)
            and (t.vh_nomer = p_permtion_no or p_permtion_no is null)
            and (t.data_nach >= p_from_date_issue or p_from_date_issue is null)
            and (t.data_nach <= p_to_date_issue or p_to_date_issue is null)
            and (t.data_prik >= p_from_date_action or p_from_date_action is null)
            and (t.data_prik <= p_to_date_action or p_to_date_action is null)
            and (t.net_type = p_radio_service or p_radio_service is null);
  end get_radio_nets;
--
  procedure get_geo_stat(p_company_name     IN varchar2, 
                         p_company_type     IN varchar2, 
                         p_company_EIK      IN varchar2, 
                         p_company_address  IN varchar2, 
                         p_company_web      IN varchar2, 
                         p_permition_no     IN varchar2,
                         p_from_date_issue  IN date,
                         p_to_date_issue    IN date,
                         p_from_date_action IN date,
                         p_to_date_action   IN date,
                         p_out_records OUT SYS_REFCURSOR 
                         )
                             is
  begin
    open p_out_records for
          select ul.ul_name
               , ul.ul_type
               , ul.eik
               , ul.ul_address
               , ul.web
               , lk.lk_name||' '||lk.lk_prezime||' '||lk.lk_familia lk_name
               , lk.tel
               , lk.e_mail
               , lk.lk_address
               , b0.vid_mreja
               , b0.vid_usluga
               , b0.razresh_no
               , b0.razresh_data
               , b0.zapo_deynost_data
               , b0.prikl_deynost_data
               , b0.chest_lenta 
               , status
          from mv_ioor_geosta_ul ul
          left outer join mv_uvedomlenia_lk lk on ul.id = lk.ul_id
          left join mv_geosta_bul00 b0 on b0.id = ul.id
--          left join mv_geosta_bul02 b2 on b2.id = ul.ID
 --         left join mv_geosta_mss s  on s.id = ul.ID
          where (ul.ul_name = p_company_name or p_company_name is null)
            and (ul.ul_type = p_company_type or p_company_type is null)
            and (ul.eik = p_company_EIK or p_company_EIK is null)
            and (ul.ul_address = p_company_address or p_company_address is null)
            and (ul.web = p_company_web or p_company_web is null)
            and (b0.razresh_no = p_permition_no or p_permition_no is null)
            and (b0.razresh_data >= p_from_date_issue or p_from_date_issue is null)
            and (b0.razresh_data <= p_to_date_issue or p_to_date_issue is null)
            and (b0.prikl_deynost_data >= p_from_date_action or p_from_date_action is null)
            and (b0.prikl_deynost_data <= p_to_date_action or p_to_date_action is null)
          union
          select ul.ul_name
               , ul.ul_type
               , ul.eik
               , ul.ul_address
               , ul.web
               , lk.lk_name||' '||lk.lk_prezime||' '||lk.lk_familia lk_name
               , lk.tel
               , lk.e_mail
               , lk.lk_address
               , b2.vid_mreja
               , b2.vid_usluga
               , b2.razresh_no
               , b2.razresh_data
               , b2.zapo_deynost_data
               , b2.prikl_deynost_data
               , b2.chest_lenta 
               , status
          from mv_ioor_geosta_ul ul
          left outer join mv_uvedomlenia_lk lk on ul.id = lk.ul_id
          left join mv_geosta_bul02 b2 on b2.id = ul.ID
          where (ul.ul_name = p_company_name or p_company_name is null)
            and (ul.ul_type = p_company_type or p_company_type is null)
            and (ul.eik = p_company_EIK or p_company_EIK is null)
            and (ul.ul_address = p_company_address or p_company_address is null)
            and (ul.web = p_company_web or p_company_web is null)
            and (b2.razresh_no = p_permition_no or p_permition_no is null)
            and (b2.razresh_data >= p_from_date_issue or p_from_date_issue is null)
            and (b2.razresh_data <= p_to_date_issue or p_to_date_issue is null)
            and (b2.prikl_deynost_data >= p_from_date_action or p_from_date_action is null)
            and (b2.prikl_deynost_data <= p_to_date_action or p_to_date_action is null)
          union
          select ul.ul_name
               , ul.ul_type
               , ul.eik
               , ul.ul_address
               , ul.web
               , lk.lk_name||' '||lk.lk_prezime||' '||lk.lk_familia lk_name
               , lk.tel
               , lk.e_mail
               , lk.lk_address
               , s.vid_mreja
               , s.vid_usluga
               , s.razresh_no
               , s.razresh_data
               , s.zapo_deynost_data
               , s.prikl_deynost_data
               , s.chest_lenta 
               , status
          from mv_ioor_geosta_ul ul
          left outer join mv_uvedomlenia_lk lk on ul.id = lk.ul_id
          left join mv_geosta_mss s  on s.id = ul.ID
          where (ul.ul_name = p_company_name or p_company_name is null)
            and (ul.ul_type = p_company_type or p_company_type is null)
            and (ul.eik = p_company_EIK or p_company_EIK is null)
            and (ul.ul_address = p_company_address or p_company_address is null)
            and (ul.web = p_company_web or p_company_web is null)
            and (s.razresh_no = p_permition_no or p_permition_no is null)
            and (s.razresh_data >= p_from_date_issue or p_from_date_issue is null)
            and (s.razresh_data <= p_to_date_issue or p_to_date_issue is null)
            and (s.prikl_deynost_data >= p_from_date_action or p_from_date_action is null)
            and (s.prikl_deynost_data <= p_to_date_action or p_to_date_action is null);
  end get_geo_stat;

--
  procedure get_numbers( p_company_name     IN varchar2, 
                         p_company_type     IN varchar2, 
                         p_company_EIK      IN varchar2, 
                         p_company_address  IN varchar2, 
                         p_company_web      IN varchar2, 
                         p_permition_no     IN varchar2,
                         p_from_date_issue  IN date,
                         p_to_date_issue    IN date,
                         p_out_records OUT SYS_REFCURSOR 
                         )
  is
  begin
    open p_out_records for
          select ul.ul_name
               , ul.ul_type
               , ul.eik
               , ul.ul_address
               , ul.web
               , n.resh_nomer
               , n.resh_data
               , n.data_prik
               , n.status
               , n.termination_date
               , n.vid_razreshenie
          from mv_ioor_nomera_ul ul
          join mv_ioor_nomera n on ul.ID = n.id
          where (ul.ul_name = p_company_name or p_company_name is null)
            and (ul.ul_type = p_company_type or p_company_type is null)
            and (ul.eik = p_company_EIK or p_company_EIK is null)
            and (ul.ul_address = p_company_address or p_company_address is null)
            and (ul.web = p_company_web or p_company_web is null)
            and (n.resh_nomer = p_permition_no or p_permition_no is null)
            and (n.resh_data >= p_from_date_issue or p_from_date_issue is null)
            and (n.resh_data <= p_to_date_issue or p_to_date_issue is null);
  end get_numbers;
--
  procedure get_market_significant( p_company_name     IN varchar2, 
                         p_company_type     IN varchar2, 
                         p_company_EIK      IN varchar2, 
                         p_out_records OUT SYS_REFCURSOR 
                         )
  is
  begin
    open p_out_records for
        select ul.market_name
               ,ul.resolution_no  
               ,ul.company_name
               ,ul.company_type
               ,ul.eik
               ,ul.company_address
               ,ul.requirements
               ,ul.description
          from mv_market_significant ul
          where (ul.company_name = p_company_name or p_company_name is null)
            and (ul.company_type = p_company_type or p_company_type is null)
            and (ul.eik = p_company_EIK or p_company_EIK is null)
          ;
  end get_market_significant;
--
  procedure get_transfered(p_receiver_name     IN varchar2, --  Предприятие приобретател
                           p_receiver_type     IN varchar2, --  вид
                           p_permition         IN varchar2, --  разрешение
                           p_transf_date_from  IN date,     --  дата на прехвърляне
                           p_transf_date_to    IN date,     --  
                           p_end_date_from  IN date,        --  крайна дата
                           p_end_date_to    IN date,        -- 
                           p_giving_name     IN varchar2,   --  Предприятие праводател
                           p_giving_type     IN varchar2,   --  вид
                           p_permition_g     IN varchar2,   --  разрешение
                           p_issue_date_from  IN date,      --  дата на прехвърляне
                           p_issue_date_to    IN date,      --  
                           p_out_records OUT SYS_REFCURSOR 
                           )
  is
  begin
    open p_out_records for
     select t.res_name              --  Предприятие приобретател
               , t.res_type              --  вид
               , t.res_perm_ioor         --  разрешение
               , to_date(substr(t.res_perm_date,1,10),'dd.mm.yyyy') res_perm_date        --  дата на прехвърляне
               , to_date(substr(t.res_perm_date_end,1,10),'dd.mm.yyyy') res_perm_date_end     --  крайна дата
               , t.geb_name              --  Предприятие праводател
               , t.geb_type              --  вид
               , t.geb_perm_ioor         --  разрешеие
               , to_date(substr(t.geb_perm_date,1,10),'dd.mm.yyyy') geb_perm_date         --  дата
               , to_date(substr(t.geb_perm_date_end,1,10),'dd.mm.yyyy') geb_perm_date_end     --  крайна дата
               , t.info                  --  инфо
          from mv_transfered_rights t    
          where (t.res_name = p_receiver_name or p_receiver_name is null)
            and (t.res_type = p_receiver_type or p_receiver_type is null)
            and (t.res_perm_ioor = p_permition or p_permition is null)
            and (to_date(substr(t.res_perm_date,1,10),'dd.mm.yyyy') >= p_transf_date_from or p_transf_date_from is null)
            and (to_date(substr(t.res_perm_date,1,10),'dd.mm.yyyy') <= p_transf_date_to or p_transf_date_to is null)
            and (to_date(substr(t.res_perm_date_end,1,10),'dd.mm.yyyy') >= p_end_date_from or p_end_date_from is null)
            and (to_date(substr(t.res_perm_date_end,1,10),'dd.mm.yyyy') <= p_end_date_to or p_end_date_to is null)
            and (t.geb_name = p_giving_name or p_giving_name is null)
            and (t.geb_type = p_giving_type or p_giving_type is null)
            and (t.geb_perm_ioor = p_permition_g or p_permition_g is null)
            and (to_date(substr(t.geb_perm_date,1,10),'dd.mm.yyyy') >= p_issue_date_from or p_issue_date_from is null)
            and (to_date(substr(t.geb_perm_date,1,10),'dd.mm.yyyy') <= p_issue_date_to or p_issue_date_to is null)
         ;
  end get_transfered;
--
  procedure get_leased(p_giving_name     IN varchar2, 
                       p_giving_type     IN varchar2, 
                       p_permition_g     IN varchar2, 
                       p_issue_date_from  IN date, 
                       p_issue_date_to    IN date, 
                       p_receiver_name     IN varchar2, 
                       p_receiver_type     IN varchar2, 
                       p_permition         IN varchar2, 
                       p_rent_date_from  IN date, 
                       p_rent_date_to    IN date, 
                       p_end_date_from  IN date, 
                       p_end_date_to    IN date, 
                       p_out_records OUT SYS_REFCURSOR 
                       )
  is
  begin
    open p_out_records for
          select t.geb_name          --  Предприятие наемодател
               , t.geb_type          --  вид
               , t.geb_perm_ioor     --  разрешение
               , to_date(substr(t.geb_perm_date,1,10),'dd.mm.yyyy') geb_perm_date     --  дата
               , to_date(substr(t.geb_perm_date_end,1,10),'dd.mm.yyyy') geb_perm_date_end     -- крайна дата
               , t.res_name          --  Предприятие наемател
               , t.res_type          --  вид
               , t.res_perm_ioor     --  разрешение
               , to_date(substr(t.res_perm_date,1,10),'dd.mm.yyyy') res_perm_date     --  дата
               , t.right_terit       -- Отдаден под наем радиочестотен спектър - терит обхват
               , t.right_freq        -- честоти
               , t.right_numb_blocks -- брой блокове
               , t.right_spctrum     -- спектър 
               , to_date(substr(t.right_date_start,1,10),'dd.mm.yyyy') right_date_start  -- от дата
               , to_date(substr(t.right_date_end,1,10),'dd.mm.yyyy') right_date_end    -- до дата
               , t.descr             -- Забележка
          from mv_rented_resources t
          where (t.res_name = p_receiver_name or p_receiver_name is null)
            and (t.res_type = p_receiver_type or p_receiver_type is null)
            and (t.res_perm_ioor = p_permition or p_permition is null)
            and (to_date(substr(t.right_date_start,1,10),'dd.mm.yyyy') >= p_rent_date_from or p_rent_date_from is null)
            and (to_date(substr(t.right_date_start,1,10),'dd.mm.yyyy') <= p_rent_date_to or p_rent_date_to is null)
            and (to_date(substr(t.right_date_end,1,10),'dd.mm.yyyy') >= p_end_date_from or p_end_date_from is null)
            and (to_date(substr(t.right_date_end,1,10),'dd.mm.yyyy') <= p_end_date_to or p_end_date_to is null)
            and (t.geb_name = p_giving_name or p_giving_name is null)
            and (t.geb_type = p_giving_type or p_giving_type is null)
            and (t.geb_perm_ioor = p_permition_g or p_permition_g is null)
            and (to_date(substr(t.geb_perm_date,1,10),'dd.mm.yyyy') >= p_issue_date_from or p_issue_date_from is null)
            and (to_date(substr(t.geb_perm_date,1,10),'dd.mm.yyyy') <= p_issue_date_to or p_issue_date_to is null)
            ;
  end get_leased;
--
  procedure get_number_resources(p_company_name     IN varchar2, 
                                 p_company_type     IN varchar2, 
                                 p_code             IN varchar2, 
                                 p_group            IN varchar2, 
                                 p_decision         IN varchar2,
                                 p_issue_date_from  IN date, 
                                 p_issue_date_to    IN date, 
                                 p_out_records OUT SYS_REFCURSOR 
                               )
  is
  begin
    open p_out_records for
          select t.ENTERPRISE_NAME
               , t.ENTERPRISE_TYPE
               , coalesce(t.GEO_CODE,t.ACCESS_CODE,t.CODE_PROVIDED,t.ispc,t.nspc,t.NATIONAL_NUMBER) code
               , t.GROUP_OF_NUMBERS
               , t.service
               , t.decision_no
               , t.decision_date
          from mv_nomera_all t
          where (t.ENTERPRISE_NAME = p_company_name or p_company_name is null)
            and (t.ENTERPRISE_TYPE = p_company_type or p_company_type is null)
            and (coalesce(t.GEO_CODE,t.ACCESS_CODE,t.CODE_PROVIDED,t.ispc,t.nspc,t.NATIONAL_NUMBER) = p_code or p_code is null)
            and (t.GROUP_OF_NUMBERS >= p_group or p_group is null)
            and (t.decision_no = p_decision or p_decision is null)
            and (t.decision_date >= p_issue_date_from or p_issue_date_from is null)
            and (t.decision_date <= p_issue_date_to or p_issue_date_to is null);
  end get_number_resources;                      
--
  procedure get_post_universal(p_company_name     IN varchar2, 
                               p_company_type     IN varchar2, 
                               p_uri              IN varchar2, 
                               p_address          IN varchar2, 
                               p_license          IN varchar2,
                               p_issue_date_from  IN date, 
                               p_issue_date_to    IN date, 
                               p_start_date_from  IN date, 
                               p_start_date_to    IN date, 
                               p_end_date_from    IN date, 
                               p_end_date_to      IN date, 
                               p_shipments        IN varchar2,
                               p_parcels          IN varchar2,
                               p_additionals      IN varchar2, 
                               p_transfers        IN varchar2,
                               p_out_records OUT SYS_REFCURSOR 
                               )
  is
  begin
    open p_out_records for
          select t.ul_name
               , t.ul_type
               , t.uri
               , t.ul_gr_selo||t.ul_nas_mesto||' Община:'||t.ul_obshtina||' Област:'||t.ul_oblast||' '||t.ul_address address
               , u.vhod_nomer
               , u.vhod_data
               , u.nach_data
               , u.krai_data
               , u.posht_pratki
               , u.posht_koleti
               , u.dop_uslugi
               , u.par_prev
               , u.ter_obhvat
               , u.zabelejka
          from mv_poshti_upu_ul t
          join mv_poshti_upu u on t.ID = u.ul_id
          where (t.ul_name = p_company_name or p_company_name is null)
            and (t.ul_type = p_company_type or p_company_type is null)
            and (t.uri = p_uri or p_uri is null)
            and (t.ul_gr_selo||t.ul_nas_mesto||' Община:'||t.ul_obshtina||' Област:'||t.ul_oblast||' '||t.ul_address = p_address or p_address is null)
            and (u.vhod_nomer = p_license or p_license is null)
            and (u.vhod_data >= p_issue_date_from or p_issue_date_from is null)
            and (u.vhod_data <= p_issue_date_to or p_issue_date_to is null)
            and (u.nach_data >= p_start_date_from or p_start_date_from is null)
            and (u.nach_data <= p_start_date_to or p_start_date_to is null)
            and (u.krai_data >= p_end_date_from or p_end_date_from is null)
            and (u.krai_data <= p_end_date_to or p_end_date_to is null)
            and (u.posht_pratki >= p_shipments or p_shipments is null)
            and (u.posht_koleti = p_parcels or p_parcels is null)
            and (u.dop_uslugi >= p_additionals or p_additionals is null)
            and (u.par_prev = p_transfers or p_transfers is null);
  end get_post_universal;                      
--
  procedure get_post_non_universal(p_company_name     IN varchar2, 
                                   p_company_type     IN varchar2, 
                                   p_address          IN varchar2, 
                                   p_license          IN varchar2,
                                   p_issue_date_from  IN date, 
                                   p_issue_date_to    IN date, 
                                   p_shipments        IN varchar2,
                                   p_cour_services    IN varchar2,
                                   p_advertising      IN varchar2, 
                                   p_out_records OUT SYS_REFCURSOR 
                                   )
  is
  begin
    open p_out_records for
          select t.ul_name
               , t.ul_type
               , t.ul_gr_selo||t.ul_nas_mesto||' Община:'||t.ul_obshtina||' Област:'||t.ul_oblast||' '||t.ul_address address
               , u.vhod_nomer
               , u.vhod_data
               , u.posht_pratki 
               , u.kurier_uslugi
               , u.priaka_post_reklama
               , u.zabelejka
          from mv_poshti_npu_ul t
          join mv_poshti_npu u on t.ID = u.ul_id
          where (t.ul_name = p_company_name or p_company_name is null)
            and (t.ul_type = p_company_type or p_company_type is null)
            and (t.ul_gr_selo||t.ul_nas_mesto||' Община:'||t.ul_obshtina||' Област:'||t.ul_oblast||' '||t.ul_address = p_address or p_address is null)
            and (u.vhod_nomer = p_license or p_license is null)
            and (u.vhod_data >= p_issue_date_from or p_issue_date_from is null)
            and (u.vhod_data <= p_issue_date_to or p_issue_date_to is null)
            and (u.posht_pratki >= p_shipments or p_shipments is null)
            and (u.kurier_uslugi = p_cour_services or p_cour_services is null)
            and (u.priaka_post_reklama = p_advertising or p_advertising is null);
  end get_post_non_universal;                      
                                   
  

end regix_registers;
/
