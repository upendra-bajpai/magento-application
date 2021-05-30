import os
import datetime
import glob
import sys
def move_files():
	print('give file name')
	file_name=sys.argv[0]
	root=os.getcwd()
	fol_bloc=['bloc','components','models','repository']
	for iff in fol_bloc:
		mv_bloc=os.path(root,iff,file_name+'_'+iff+'.dart')
		try:
			f=open(mv_bloc,'a')
		except Exception as e:
			print(e)
			pass
	pass
move_files()