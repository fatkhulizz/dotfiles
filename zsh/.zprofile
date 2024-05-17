 if [[ $XDG_CURRENT_DESTOP == "i3" ]]; then
	 export QT_QPA_PLATFORMTHEME="qt6ct"
	 # java ugly looks fix. from https://locxter.net/articles/integrating-bspwm-with-xfce4-for-the-perfect-dewm-setup.html
	 export _JAVA_AWT_WM_NONREPARENTING=1
	 export AWT_TOOLKIT=MToolkit
	 export JAVA_TOOL_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
	 export JDK_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
	 export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
 fi

if hash nvim 2>/dev/null; then
	export EDITOR=nvim

	# Use nvim as manpager `:h Man`
	export MANPAGER='nvim +Man!'
else
	export EDITOR=vim
fi

