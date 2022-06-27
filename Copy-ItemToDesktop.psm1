function Copy-ItemToDesktop{
     Param(
       [Parameter(ValueFromPipeline)]
       [psobject]$InputObject
     )
     Process{
       if($InputObject.PSIsContainer){
         $Destination = "~\Desktop" + ($InputObject.FullName | Split-Path -NoQualifier)
         if(Test-Path $Destination){
             Copy-Item -Recurse -Force -Path $InputObject.FullName -Destination ($Destination | Split-Path)
         } else {
             Copy-Item -Recurse -Path $InputObject.FullName -Destination $Destination
         }
       } else{
         $Destination = "~\Desktop" + ($InputObject.FullName | Split-Path -NoQualifier)
         if(Test-Path ($Destination | Split-Path)){
             Copy-Item -Path $InputObject.FullName -Destination $Destination
         } else {
             Copy-Item -Path ($InputObject.FullName | Split-Path) -Destination ($Destination | Split-Path)
             Copy-Item -Path $InputObject.FullName -Destination $Destination
         }
       }
     }
}
