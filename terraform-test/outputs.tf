tfplan����Plan�� 	Diff�� Module�� State�� Vars�� Targets�� TerraformVersion ProviderSHA256s�� Backend�� Destroy   ��Diff�� Modules��   &��[]*terraform.ModuleDiff�� ��  1���� Path�� 	Resources�� Destroy   ��[]string��   3��"map[string]*terraform.InstanceDiff�� ��  f��InstanceDiff�� 
Attributes�� Destroy DestroyDeposed DestroyTainted Meta��   7��&map[string]*terraform.ResourceAttrDiff�� ��  o���� Old New NewComputed 
NewRemoved NewExtra RequiresNew 	Sensitive Type   '��map[string]interface {}��   
����   j��State�� Version 	TFVersion Serial Lineage Remote�� Backend�� Modules��   .��RemoteState�� Type Config��   !��map[string]string��   8��BackendState�� Type Config�� Hash   '��[]*terraform.ModuleState�� ��  P���� Path�� Locals�� Outputs�� 	Resources�� Dependencies��   2��!map[string]*terraform.OutputState�� ��  -���� 	Sensitive Type Value   4��#map[string]*terraform.ResourceState�� ��  N���� Type Dependencies�� Primary�� Deposed�� Provider   W��InstanceState�� ID 
Attributes�� 	Ephemeral�� Meta�� Tainted   3��EphemeralState�� ConnInfo�� Type   )��[]*terraform.InstanceState�� ��  "��map[string][]uint8�� 
  �9���rootaws_vpc.vpc-11111111id tags.%2 	tags.NameTidal-Test-VPC  assign_generated_ipv6_cidr_blockfalse main_route_table_id 
cidr_block10.0.0.0/16 dhcp_options_id default_network_acl_id ipv6_association_id default_route_table_id default_security_group_id tags.Servicetest_service instance_tenancydefault enable_classiclink enable_classiclink_dns_support ipv6_cidr_block arn enable_dns_supporttrue enable_dns_hostnamestrue  aws_internet_gateway.gw	tags.NameTidal-Test_ig tags.Servicetest_service vpc_id${aws_vpc.vpc-11111111.id} tags.%02 id  aws_subnet.subnet-bbbbbbbbvpc_id${aws_vpc.vpc-11111111.id} tags.Servicetest_service assign_ipv6_address_on_creationfalse availability_zone
us-west-2b map_public_ip_on_launchtrue tags.%2 ipv6_cidr_block arn 
cidr_block10.0.16.0/24 ipv6_cidr_block_association_id 	tags.NameTidal-Test_Subnet-B id  aws_security_group.elbsgid ingress.2617001939.from_port443 egress.482069346.description $ingress.2617001939.security_groups.#0 egress.#1 "egress.482069346.security_groups.#0  ingress.2617001939.cidr_blocks.0	0.0.0.0/0 	ingress.#1 "egress.482069346.prefix_list_ids.#0 vpc_id${aws_vpc.vpc-11111111.id} 	tags.NameTidal-Test_ELB_Security_Group owner_id egress.482069346.from_port0 ingress.2617001939.selffalse ingress.2617001939.to_port443 egress.482069346.cidr_blocks.0	0.0.0.0/0 egress.482069346.to_port0 ingress.2617001939.protocoltcpstring tcp egress.482069346.protocol-1string -1 #egress.482069346.ipv6_cidr_blocks.#0 tags.Servicetest_service descriptionHLoad Balancer Security Group Allow incoming and ougoing HTTP connections ingress.2617001939.description nameTidal-Test_ELB_SG egress.482069346.cidr_blocks.#1 arn egress.482069346.selffalse tags.%2 %ingress.2617001939.ipv6_cidr_blocks.#0 revoke_rules_on_deletefalse  ingress.2617001939.cidr_blocks.#1 $e2bfb730-ecaa-11e6-8f88-34363bc7c4c0map[string]interface {}��0 createint64 �e�� deleteint64 �e��  aws_route_table.rroute.#1  route.~2599208424.nat_gateway_id &route.~2599208424.network_interface_id route.~2599208424.instance_id !route.~2599208424.ipv6_cidr_block 	tags.NameTidal-Test_Route_Table tags.Servicetest_service +route.~2599208424.vpc_peering_connection_id propagating_vgws.# route.~2599208424.gateway_id${aws_internet_gateway.gw.id} tags.%2 id vpc_id${aws_vpc.vpc-11111111.id} route.~2599208424.cidr_block	0.0.0.0/0 (route.~2599208424.egress_only_gateway_id  aws_route_table_association.a	subnet_id ${aws_subnet.subnet-aaaaaaaa.id} route_table_id${aws_route_table.r.id} id  aws_security_group.appsg	tags.NameTidal-Test_App_Security_Group ingress.~720993836.description ingress.~720993836.to_port8080 nameTidal-Test_APP_SG "egress.482069346.prefix_list_ids.#0 egress.#1 egress.482069346.selffalse descriptionApplication Security Group id tags.%2 %ingress.~720993836.ipv6_cidr_blocks.#0 egress.482069346.to_port0 egress.482069346.cidr_blocks.0	0.0.0.0/0 egress.482069346.from_port0 ingress.~720993836.selffalse owner_id #egress.482069346.ipv6_cidr_blocks.#0 egress.482069346.description 	ingress.#1 tags.Servicetest_service egress.482069346.cidr_blocks.#1 ingress.~720993836.from_port8080 ingress.~720993836.protocoltcpstring tcp arn  ingress.~720993836.cidr_blocks.#0 "egress.482069346.security_groups.#0 $ingress.~720993836.security_groups.# egress.482069346.protocol-1string -1 vpc_id${aws_vpc.vpc-11111111.id} revoke_rules_on_deletefalse $e2bfb730-ecaa-11e6-8f88-34363bc7c4c0map[string]interface {}��0 createint64 �e�� deleteint64 �e��  aws_elb.web$zone_id tags.Servicetest_service health_check.0.timeout2 health_check.#1 "health_check.0.unhealthy_threshold3 listener.1506804148.lb_protocolhttps  health_check.0.healthy_threshold3 
listener.#1 	tags.NameTidalTestELB health_check.0.targetHTTP:8000/health instances.# internal !listener.1506804148.instance_port8080 idle_timeout60 availability_zones.# tags.%2 	subnets.# dns_name arn connection_drainingfalse id nameTidalTestELB security_groups.# cross_zone_load_balancingtrue connection_draining_timeout300 %listener.1506804148.instance_protocolhttp listener.1506804148.lb_port443 access_logs.0.bucket_prefixTidalTestELB access_logs.0.buckettidal-elb-logs &listener.1506804148.ssl_certificate_idSarn:aws:acm:us-west-2:536113069127:certificate/c48c29f1-1abf-4961-ad19-98ec330c5764 health_check.0.interval10 source_security_group_id access_logs.0.enabledtrue access_logs.0.interval5 access_logs.#1 source_security_group  aws_s3_bucket.bucketaclprivate acceleration_status bucket_regional_domain_name request_payer arn region website_domain versioning.# bucket_domain_name id hosted_zone_id policy�3{
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::tidal-elb-logs/*",
      "Principal": {
        "AWS": [
          "arn:aws:iam::797873946194:root"
        ]
      }
    }
  ]
}
 force_destroyfalse buckettidal-elb-logs website_endpoint  aws_subnet.subnet-aaaaaaaatags.%2 	tags.NameTidal-Test_Subnet-A tags.Servicetest_service 
cidr_block10.0.0.1/24 map_public_ip_on_launchtrue assign_ipv6_address_on_creationfalse arn ipv6_cidr_block vpc_id${aws_vpc.vpc-11111111.id} availability_zone
us-west-2a ipv6_cidr_block_association_id id  aws_route_table_association.b	subnet_id ${aws_subnet.subnet-bbbbbbbb.id} route_table_id${aws_route_table.r.id} id    �!XB��treeGob�� Config�� Children�� Name Path��   ����Config�� 	Dir 	Terraform�� Atlas�� Modules�� ProviderConfigs�� 	Resources�� 	Variables�� Locals�� Outputs��   8��	Terraform�� RequiredVersion Backend��   6��Backend�� Type 	RawConfig�� Hash   
����   '��map[string]interface {}��   ����   ����   <��AtlasConfig�� Name Include�� Exclude��   ��[]string��   ��[]*config.Module�� ��  J���� Name Source Version 	Providers�� 	RawConfig��   !��map[string]string��   '��[]*config.ProviderConfig�� ��  :���� Name Alias Version 	RawConfig��   !��[]*config.Resource�� ��  ������ 	Mode Name Type RawCount�� 	RawConfig�� Provisioners�� Provider 	DependsOn�� 	Lifecycle��   $��[]*config.Provisioner�� ��  I���� Type 	RawConfig�� ConnInfo�� When 	OnFailure   ]��ResourceLifecycle�� CreateBeforeDestroy PreventDestroy IgnoreChanges��   !��[]*config.Variable�� ��  B���� Name DeclaredType Default Description   ��[]*config.Local�� ��  $���� Name 	RawConfig��   ��[]*config.Output�� ��  Q���� Name 	DependsOn�� Description 	Sensitive 	RawConfig��   (��map[string]*module.Tree�� ��  
����   ����(/Users/akskumar/Documents/Terraform/Testaws��+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ����profilestring 	terraformregionstring ${var.aws_region}shared_credentials_filestring"  /Users/akskumar/.aws/credentials  mainaws_elb_service_accounts+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 Z+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��    vpc-11111111aws_vpcs+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 �
+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   0��tags[]map[string]interface {}���� ��  ����@ Namestring Tidal-Test-VPCServicestring test_service
cidr_blockstring 10.0.0.0/16enable_dns_hostnamesbool    subnet-aaaaaaaa
aws_subnets+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 �e+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   x��availability_zonestring 
us-west-2amap_public_ip_on_launchbool tags[]map[string]interface {}���� ��  ����E Namestring Tidal-Test_Subnet-AServicestring test_servicevpc_idstring ${aws_vpc.vpc-11111111.id}
cidr_blockstring 10.0.0.1/24   subnet-bbbbbbbb
aws_subnets+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 �f+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   0��tags[]map[string]interface {}���� ��  ����E Namestring Tidal-Test_Subnet-BServicestring test_servicevpc_idstring ${aws_vpc.vpc-11111111.id}
cidr_blockstring 10.0.16.0/24availability_zonestring 
us-west-2bmap_public_ip_on_launchbool    gwaws_internet_gateways+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 ��+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   \��vpc_idstring ${aws_vpc.vpc-11111111.id}tags[]map[string]interface {}���� ��  C��? Namestring Tidal-Test_igServicestring test_service   raws_route_tables+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 �w+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ]��vpc_idstring ${aws_vpc.vpc-11111111.id}route[]map[string]interface {}���� ��  ����U 
cidr_blockstring 	0.0.0.0/0
gateway_idstring ${aws_internet_gateway.gw.id}tags[]map[string]interface {}��H Namestring Tidal-Test_Route_TableServicestring test_service   aaws_route_table_associations+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 ��+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   k��	subnet_idstring"  ${aws_subnet.subnet-aaaaaaaa.id}route_table_idstring ${aws_route_table.r.id}   baws_route_table_associations+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 ��+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   k��	subnet_idstring"  ${aws_subnet.subnet-bbbbbbbb.id}route_table_idstring ${aws_route_table.r.id}   elbsgaws_security_groups+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 ��+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   \��vpc_idstring ${aws_vpc.vpc-11111111.id}tags[]map[string]interface {}���� ��  ���O Namestring Tidal-Test_ELB_Security_GroupServicestring test_servicenamestring Tidal-Test_ELB_SGdescriptionstringJ HLoad Balancer Security Group Allow incoming and ougoing HTTP connectionsingress[]map[string]interface {}��g 	from_portint �vto_portint �vprotocolstring tcpcidr_blocks[]interface {}����   �� string 	0.0.0.0/0egress[]map[string]interface {}��o 	from_portint  to_portint  protocolstring -1cidr_blocks[]interface {}�� string 	0.0.0.0/0   bucketaws_s3_buckets+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 ��+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ����aclstring	 privatepolicystring�A �={
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::tidal-elb-logs/*",
      "Principal": {
        "AWS": [
          "${data.aws_elb_service_account.main.arn}"
        ]
      }
    }
  ]
}
bucketstring tidal-elb-logs   webaws_elbs+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 ��+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   '��subnets[]interface {}����   ����X string"  ${aws_subnet.subnet-aaaaaaaa.id}string"  ${aws_subnet.subnet-bbbbbbbb.id}security_groups[]interface {}��+ string  ${aws_security_group.elbsg.id}access_logs[]map[string]interface {}���� ��  ����i bucketstring  ${aws_s3_bucket.bucket.bucket}bucket_prefixstring TidalTestELBintervalint 
listener[]map[string]interface {}���� ssl_certificate_idstringU Sarn:aws:acm:us-west-2:536113069127:certificate/c48c29f1-1abf-4961-ad19-98ec330c5764instance_portint �? instance_protocolstring httplb_portint �vlb_protocolstring httpshealth_check[]map[string]interface {}��| healthy_thresholdint unhealthy_thresholdint timeoutint targetstring HTTP:8000/healthintervalint tags[]map[string]interface {}��> Servicestring test_serviceNamestring TidalTestELBnamestring TidalTestELB   appsgaws_security_groups+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ��countcountstring 1 ��+��gobRawConfig�� Key Raw��   '��map[string]interface {}��   ����namestring Tidal-Test_APP_SGdescriptionstring Application Security Groupvpc_idstring ${aws_vpc.vpc-11111111.id}ingress[]map[string]interface {}���� ��  ����k 	from_portint �? to_portint �? protocolstring tcpsecurity_groups[]interface {}����   .��+ string  ${aws_security_group.elbsg.id}egress[]map[string]interface {}��o 	from_portint  to_portint  protocolstring -1cidr_blocks[]interface {}�� string 	0.0.0.0/0tags[]map[string]interface {}��O Namestring Tidal-Test_App_Security_GroupServicestring test_service   
aws_regionstring 	us-west-2AWS region to launch servers.    0.11.8$6348fecf-1a61-850c-38ae-6239bb6fb60broot !data.aws_elb_service_account.mainaws_elb_service_account797873946194arnarn:aws:iam::797873946194:rootid797873946194  provider.aws   
aws_regionstring 	us-west-20.11.8aws $C��䪋�fh
�@� sGv�.Pڥ�)�z�� 