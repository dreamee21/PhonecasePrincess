<?
    /* ============================================================================== */
    /* =   PAGE : ���� ���� ȯ�� ���� PAGE                                          = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.= */
    /* =   ���� �ּ� : http://testpay.kcp.co.kr/pgsample/FAQ/search_error.jsp       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2010.05   KCP Inc.   All Rights Reserved.                 = */
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   01. ���� ������ �¾� (��ü�� �°� ����)                                  = */
    /* = -------------------------------------------------------------------------- = */
    /* = �� ���� ��                                                                 = */
    /* = * g_conf_home_dir ���� ����                                                = */
    /* =   BIN ���� ��� �Է� (bin������ ����						                = */
    /* = -------------------------------------------------------------------------- = */

    // $g_conf_home_dir  = "/home/kcpuser/pgsample/USER/lds/smart_phone_linux_php";       // BIN ������ �Է� (bin������) 
    $g_conf_home_dir = "/Users/jehyeok/Documents/workspace/iOS-temp2/PhonecasePrincess/smart_phone_linux_php_64";
    
    /* ============================================================================== */
    /* =   02. ���θ� ���� ���� ����                                                = */
    /* = -------------------------------------------------------------------------- = */

    /* = -------------------------------------------------------------------------- = */
    /* =     02-1. ���θ� ���� �ʼ� ���� ����(��ü�� �°� ����)                     = */
    /* = -------------------------------------------------------------------------- = */
    /* = �� ���� ��                                                                 = */
    /* = * g_conf_gw_url ����                                                       = */
    /* =                                                                            = */
    /* = �׽�Ʈ �� : testpaygw.kcp.co.kr�� ������ �ֽʽÿ�.                         = */
    /* = �ǰ��� �� : paygw.kcp.co.kr�� ������ �ֽʽÿ�.                             = */
	/* =                                                                            = */
    /* = * g_conf_site_cd, g_conf_site_key ����                                     = */
    /* = �ǰ����� KCP���� �߱��� ����Ʈ�ڵ�(site_cd), ����ƮŰ(site_key)�� �ݵ��   = */
    /* =   ������ �ּž� ������ ���������� ����˴ϴ�.                              = */
    /* =                                                                            = */
    /* = �׽�Ʈ �� : ����Ʈ�ڵ�(T0000)�� ����ƮŰ(3grptw1.zW0GSo4PQdaGvsF__)��      = */
    /* =            ������ �ֽʽÿ�.                                                = */
    /* = �ǰ��� �� : �ݵ�� KCP���� �߱��� ����Ʈ�ڵ�(site_cd)�� ����ƮŰ(site_key) = */
    /* =            �� ������ �ֽʽÿ�.                                             = */
    /* =                                                                            = */
    /* = * g_conf_site_name ����                                                    = */
    /* = ����Ʈ�� ����(�ѱ� �Ұ�) : �ݵ�� �����ڷ� �����Ͽ� �ֽñ� �ٶ��ϴ�.       = */
    /* = -------------------------------------------------------------------------- = */

    $g_conf_gw_url    = "testpaygw.kcp.co.kr";
    $g_conf_site_cd   = "T0000";
    $g_conf_site_key  = "3grptw1.zW0GSo4PQdaGvsF__";
    $g_conf_site_name = "KCP TEST SHOP";
    $g_wsdl           = "KCPPaymentService.wsdl";

    /* ============================================================================== */


    /* = -------------------------------------------------------------------------- = */
    /* =     02-2. ���� ������ �¾� (���� �Ұ�)                                     = */
    /* = -------------------------------------------------------------------------- = */

    $g_conf_gw_port   = "8090";        // ��Ʈ��ȣ(����Ұ�)
    $g_conf_log_level = 3;
    /* ============================================================================== */
?>