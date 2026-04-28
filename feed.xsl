<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <title>Feed | <xsl:value-of select="/rss/channel/title | /atom:feed/atom:title"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" type="text/css" href="/style.css" />
        <style type="text/css">
          header {
            margin-bottom: 3rem;
            text-align: center;
          }
          header h1 {
            margin-bottom: 0.5rem;
          }
          .feed-description {
            color: var(--color-text-secondary);
            font-style: italic;
            margin-bottom: 1rem;
          }
        </style>
      </head>
      <body>

        <header>
          <h1><xsl:value-of select="/rss/channel/title | /atom:feed/atom:title"/></h1>
          <p class="feed-description">
            <xsl:value-of select="/rss/channel/description | /atom:feed/atom:subtitle"/>
          </p>
          <p>
            <a target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="/rss/channel/link | /atom:feed/atom:link[@rel='alternate']/@href | /atom:feed/atom:link[not(@rel)]/@href"/>
              </xsl:attribute>
              Visit Website &#x2192;
            </a>
          </p>
        </header>

        <section class="next">
          <div>
            <p><u><em><strong>This is a web feed,</strong> also known as an RSS feed. <strong>Subscribe</strong> by copying the URL from the address bar into your newsreader.</em></u></p>
          </div>
        </section>

        <section>
          <h2 class="latest-month-header">Feed</h2>
          
          <xsl:for-each select="/rss/channel/item">
            <article class="listing">
              <a target="_blank">
                <xsl:attribute name="href">
                  <xsl:value-of select="link"/>
                </xsl:attribute>
                <xsl:value-of select="title"/>
              </a>
              <span class="separator"></span>
              <time>
                <xsl:value-of select="substring(pubDate, 6, 11)"/>
              </time>
            </article>
          </xsl:for-each>

          <xsl:for-each select="/atom:feed/atom:entry">
            <article class="listing">
              <a target="_blank">
                <xsl:attribute name="href">
                  <xsl:value-of select="atom:link/@href"/>
                </xsl:attribute>
                <xsl:value-of select="atom:title"/>
              </a>
              <span class="separator"></span>
              <time>
                <xsl:value-of select="substring(atom:updated, 1, 10)"/>
              </time>
            </article>
          </xsl:for-each>
        </section>

        <footer>
          <a href="/">Home</a>
          <a href="/rss.xml">RSS</a>
          <a href="/atom.xml">Atom</a>
        </footer>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
