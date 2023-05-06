swapoff -a
zramctl -f
for((i=0;i<=7;i++))
do
	echo zstd > /sys/block/zram$i/comp_algorithm
	echo 200M > /sys/block/zram$i/disksize
	mkswap /dev/zram$i
	swapon -p3 /dev/zram$i
done
