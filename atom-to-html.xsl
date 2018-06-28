<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://webis.de/feedreader/model/atom" version="1.0" exclude-result-prefixes="atom">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Reader</title>
        <link rel="stylesheet" href="css/feedreader.css"/>
      </head>
      <body>

        <div class="wrapper">
          <header class="site-head">
            <a href="#" class="site-title">
              <img src="img/feed.svg" alt="Feed SVG icon: Two white signal waves on an orange background."/>
              <h1>Reader</h1>
            </a>
            <button onclick="myFunction()">Show/Hide AddEntry Field</button>
          </header>
          <div id="entry-field">
            <h3>Add entry</h3>
            <form action="welcome.jsp" method="post">
              <table>
                <tr>
                  <td>Title:</td>
                  <td>
                    <input type="text" name="Title"/>
                  </td>
                </tr>
                <tr>
                  <td>URL:</td>
                  <td>
                    <input type="text" name="URL"/>
                  </td>
                </tr>
                <tr>
                  <td>Author:</td>
                  <td>
                    <input type="text" name="Author"/>
                  </td>
                </tr>
                <tr>
                  <td>Summary:</td>
                  <td>
                    <input type="text" name="Summary"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td>
                    <input type="submit" value="Submit"/>
                  </td>
                </tr>
              </table>
            </form>
          </div>
          <script>
            function myFunction() {
                var x = document.getElementById("entry-field");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
            </script>
          <div class="page-content">
            <!-- In order to account for Atom entry resources as
                        well, the value for the select attribute needs to be
                        changed to `atom:feed|atom:entry`. -->
            <xsl:apply-templates select="atom:feed"/>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="atom:feed">
    <aside>
      <h2>
        <xsl:value-of select="atom:title"/>
      </h2>
      <p>
        <xsl:value-of select="atom:subtitle"/>
      </p>
    </aside>
    <main>
      <xsl:apply-templates select="atom:entry"/>
    </main>
  </xsl:template>
  <xsl:template match="atom:entry">
    <article class="post">
      <header>
        <h3 class="post-title">
          <a href="{atom:link/@href}">
            <xsl:value-of select="atom:title"/>
          </a>
        </h3>
      </header>
      <div class="post-content">
        <p>
          <xsl:value-of select="atom:summary"/>
        </p>
      </div>
      <footer class="meta-information">
                published on
                <time><xsl:attribute name="datetime"><xsl:value-of select="substring-before(atom:updated, 'T')"/></xsl:attribute><xsl:value-of select="substring-before(atom:updated, 'T')"/></time>
                by
                <xsl:apply-templates select="atom:author"/>
            </footer>
    </article>
  </xsl:template>
  <xsl:template match="atom:author">
    <span class="author">
      <xsl:value-of select="atom:name"/>
    </span>
  </xsl:template>
</xsl:stylesheet>
