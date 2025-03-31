BEGIN {
  delete array;
}
{
  split($0,a,"(");
  if (a[1] == "mmap")
  {
    split(a[2], b, "=");
    split(a[2], c, ",");
    gsub(" ","",b[2]);
    array[b[2]] = c[2];
  }
  else if (a[1] == "munmap")
  {
    split(a[2], b, ",");
    if (b[1] in array)
    {
      array[b[1]] = 0;
    }
  }
}
END {
  for (i in array)
  {
    if (array[i])
    {
      print "\033[31m", "NO Free",array[i], "bytes at" "\033[0m", i;
    }
  }
}


BEGIN { delete array; } { split($0,a,"("); if (a[1] == "mmap") { split(a[2], b, "="); split(a[2], c, ","); gsub(" ","",b[2]); array[b[2]] = c[2]; } else if (a[1] == "munmap") { split(a[2], b, ","); if (b[1] in array) { array[b[1]] = 0; } } } END { for (i in array) { if (array[i]) { print "\033[31m", "NO Free",array[i], "bytes at" "\033[0m", i; } } }
