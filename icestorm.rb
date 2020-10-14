class Icestorm < Formula
  desc "tools for documenting and working with iCE40 FPGA files"
  homepage "https://github.com/cliffordwolf/icestorm"
  head "https://github.com/cliffordwolf/icestorm.git"

  depends_on "pkg-config"
  depends_on "libftdi"
  depends_on "python"
  depends_on "icestorm"

  patch :DATA

  def install
    system "make", "install", "PREFIX=#{prefix}"

    # FIXME: Icestorm installs a set of utility functions and database definitions into /bin/,
    # as it lacks e.g. a setup.py for its module. This should be correced in icestorm, but I'm leaving it
    # for now (I should fix this upstream).
  end

end


__END__
diff --git a/icebox/Makefile b/icebox/Makefile
index 2897dfb..7862739 100644
--- a/icebox/Makefile
+++ b/icebox/Makefile
@@ -56,27 +56,27 @@ install: all
	cp icebox_maps.py    $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
	cp icebox_vlog.py    $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
	cp icebox_stat.py    $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
-	sed -i 's+import iceboxdb+import $(subst -,_,$(PROGRAM_PREFIX))iceboxdb as iceboxdb+g' $(DESTDIR)$(PREFIX)/bin/$(subst -,_,$(PROGRAM_PREFIX))icebox.py
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_chipdb$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_diff$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_diff$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_explain$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_explain$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_asc2hlc$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_asc2hlc$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_hlc2asc$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_hlc2asc$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_colbuf$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_colbuf$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_html$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_html$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
-	sed -i 's+/usr/local/share/icebox+$(PREFIX)/share/$(PROGRAM_PREFIX)icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
+	sed -i'' -e 's+import iceboxdb+import $(subst -,_,$(PROGRAM_PREFIX))iceboxdb as iceboxdb+g' $(DESTDIR)$(PREFIX)/bin/$(subst -,_,$(PROGRAM_PREFIX))icebox.py
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_chipdb$(PY_EXE)
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_diff$(PY_EXE)
+	sed -i'' -e 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_diff$(PY_EXE)
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_explain$(PY_EXE)
+	sed -i'' -e 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_explain$(PY_EXE)
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_asc2hlc$(PY_EXE)
+	sed -i'' -e 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_asc2hlc$(PY_EXE)
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_hlc2asc$(PY_EXE)
+	sed -i'' -e 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_hlc2asc$(PY_EXE)
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_colbuf$(PY_EXE)
+	sed -i'' -e 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_colbuf$(PY_EXE)
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_html$(PY_EXE)
+	sed -i'' -e 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_html$(PY_EXE)
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
+	sed -i'' -e 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
+	sed -i'' -e 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
+	sed -i'' -e 's+/usr/local/share/icebox+$(PREFIX)/share/$(PROGRAM_PREFIX)icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
+	sed -i'' -e 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
+	sed -i'' -e 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
