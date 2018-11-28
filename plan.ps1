$pkg_name="winlogbeat"
$pkg_origin="devoptimist"                                                                                
$pkg_version="6.5.1"                                                                                       
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"                                              
$pkg_license=@("Apache-2.0")                                                                                
$pkg_bin_dirs=@("bin")
$pkg_svc_user="hab" 
$pkg_source="https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-6.5.1-windows-x86_64.zip"
$pkg_shasum="0cf2830d424f5cce5e2a3f1c9ad45956b9c8cece5c9c2846e9b666dc60e5f8cf"
$pkg_dirname = "winlogbeat"
$pkg_binds_optional=@{
  "kibana"="port"                                                                                         
  "elasticsearch"="http-port"                                                                             
  "logstash"="port"                                                                                       
}

$pkg_description="Lightweight shipper for windows metrics"
$pkg_upstream_url="https://www.elastic.co/products/beats/winlogbeat"

Function Invoke-Unpack {
  Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_name-$pkg_version-windows-x86_64.zip" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname"
}   

Function Invoke-Install {
  echo "pkg_prefix: $pkg_prefix/bin"
  echo "$HAB_CACHE_SRC_PATH"
  ls $HAB_CACHE_SRC_PATH
  ls $HAB_CACHE_SRC_PATH/$pkg_dirname
  Copy-Item * "$pkg_prefix/bin" -Recurse -Force
  mv "$pkg_prefix/bin/winlog*.*/*" "$pkg_prefix/bin/"
}
