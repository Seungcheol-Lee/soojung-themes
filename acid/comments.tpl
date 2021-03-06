{if $entry->isSetOption("NO_COMMENT") == false}
<div class="comments" id="comment{$entry->entryId}">
<p>{$entry->getCommentCount()} Comments</p>
{foreach from=$comments item=comment}
<div class="comment">
	<div id="CO{$comment->date}">
    On {$comment->date|date_format:"%B %d, %Y %I:%M %p"},
    {if $comment->homepage != ""}
    <a href="{$comment->homepage|escape}">{$comment->name|escape}</a>
    {elseif $comment->email != ""}
    <a href="mailto:{$comment->email|escape}">{$comment->name|escape}</a>
    {else}
    {$comment->name|escape}
    {/if}
    said: <br />
    {$comment->getBody()}
    </div>
</div>
{/foreach}
</div>
<form action="{$baseurl}/entry.php?blogid={$entry->entryId}" method="post">
<p>Post a comment</p>
<p>Name:<br />
<input type="text" name="{$name_name}" value="{$w_name|escape}" /></p>
<p>Email Address:<br />
<input type="text" name="{$email_name}" value="{$w_email|escape}" /></p>
<p>URL:<br />
<input type="text" name="{$url_name}" value="{$w_url|default:"http://"|escape}" /></p>
<p>Comments:<br />
<textarea name="{$body_name}" rows="5" cols="40"></textarea>
<input type="hidden" name="blogid" value="{$entry->entryId}" />
<input type="hidden" name="name_name" value="{$name_name}" />
<input type="hidden" name="email_name" value="{$email_name}" />
<input type="hidden" name="url_name" value="{$url_name}" />
<input type="hidden" name="body_name" value="{$body_name}" />
</p>
<p><input type="submit" value="Post" /></p>
</form>
{/if}

