{include file="document_header.tpl"}
			<div id="menu_left">
				<ul id="buttons">
{if in_array('Lieu::create',$droits)}
					<li><a href="./create/" title="Ajouter">Ajouter</a></li>
{/if}
				</ul>
			</div>
			<div id="main">
				<h1>Liste des Lieux</h1>
{if $item|@count == 0}
				<p>Aucun lieu.</p>
{if in_array('Lieu::create',$droits)}
				<form action="./create/" method="post">
				<button type="submit" name="btn_create" class="create" title="Ajouter"></button>Ajouter un lieu
				</form>
{/if}
{else}
				<table class="lieu_list">
					<tr>
						<th>nom</th>
{if in_array('Lieu::create',$droits)}
						<th colspan="3" style="text-align:right;"><form><button type="submit" formaction="./create/" formmethod="post" name="btn_create" class="create" title="Ajouter"></button></form></th>
{/if}
					</tr>
{section name=list loop=$item}
					<tr class="{if $smarty.section.list.index %2 == 0}pair{else}impair{/if}">
						<td style="width: {$fields[1].size*10}px;">{$item[list].nom}</td>
{if in_array('Lieu::read',$droits)}
						<td>
							<form action="./read/{$item[list].id}" method="post">
								<button type="submit" name="btn_read" class="read" title="Consulter"></button>
							</form>
						</td>
{/if}
{if in_array('Lieu::update',$droits)}
						<td>
							<form action="./update/{$item[list].id}" method="post">
								<button type="submit" name="btn_update" class="update" title="Modifier"></button>
							</form>
						</td>
{/if}
{if in_array('Lieu::delete',$droits)}
						<td>
							<form action="./delete/{$item[list].id}" method="post">
								<button type="submit" name="btn_delete" class="delete" title="Supprimer"></button>
							</form>
						</td>
{/if}
					</tr>
{/section}
				</table>
{/if}
			</div>
{include file="document_footer.tpl"}