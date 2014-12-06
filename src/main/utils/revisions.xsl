<?xml version="1.0" encoding="UTF-8"?>

<!-- Document : revisions.xsl Created on : February 11, 2011, 7:16 PM Author 
	: gautier -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="html" />

	<xsl:template match="/">
		<html>
			<head>
				<title>Revisions</title>
			</head>

			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="version">

		<h2>
			<u>
				Version :
				<xsl:value-of select="@id" />
			</u>
		</h2>
		# changes:
		<xsl:value-of select="count(./change/level[.='change'])" />
		- # bugfix:
		<xsl:value-of select="count(./change/level[.='bugfix'])" />

		<xsl:apply-templates select="change">
			<xsl:sort select="@id" order="descending" data-type="number" />
		</xsl:apply-templates>
		<br />

	</xsl:template>

	<xsl:template match="change">
		<xsl:param name="lvl">
			<xsl:value-of select="level" />
		</xsl:param>
		<ul>
			<li>
				<xsl:choose>
					<xsl:when test="$lvl='change'">
						Change
					</xsl:when>
					<xsl:when test="$lvl='bugfix'">
						BugFix
					</xsl:when>
				</xsl:choose>

				:
				<xsl:value-of select="title" />
				<br />
				<u>Description:</u><xsl:text> </xsl:text> <xsl:value-of select="description" />
				<br />
				<u>Resolution:</u><xsl:text> </xsl:text><xsl:value-of select="resolution" />
			</li>
		</ul>
		<br />
	</xsl:template>


</xsl:stylesheet>