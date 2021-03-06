<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Переключить навигацию</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                {if $GLOBAL.config.poolnav_enabled|default:"false"}
                <ul class="nav navbar-nav navbar-top-links">
                  <li class="dropdown">
                    <a href="#" class="navbar-brand dropdown-toggle" data-toggle="dropdown">{$GLOBAL.website.name} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      {assign var="PoolArray" value="\n"|explode:$GLOBAL.config.poolnav_pools}
                      {foreach from=$PoolArray item=pooldata}
                      {assign var="PoolURL" value="|"|explode:$pooldata}
                      {if $PoolURL|count > 1}
                      <li class="h4"><a href="{$PoolURL[1]}"><i class="fa fa-angle-double-right fa-fw"></i> {$PoolURL[0]}</a></li>
                      {/if}
                      {/foreach}
                    </ul>
                  </li>
                </ul>
                {else}
                <a class="navbar-brand" href="{$smarty.server.SCRIPT_NAME}">{$GLOBAL.website.name}</a>
                {/if}
            </div>

            <ul class="nav navbar-top-links navbar-right">
				{if $smarty.session.AUTHENTICATED|default:"0" == 1 && $GLOBAL.userdata.lastnotifications|@count|default:"0" != 0}
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bullhorn fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                    

{section notification $GLOBAL.userdata.lastnotifications}
                        <li>
                            <a href="#">
                                <div>
                                    {if $GLOBAL.userdata.lastnotifications[notification].type == new_block}<i class="fa fa-th-large fa-fw"></i>Новые блоки
                                    {else if $GLOBAL.userdata.lastnotifications[notification].type == payout}<i class="fa fa-money fa-fw"></i> Выплаты
                                    {else if $GLOBAL.userdata.lastnotifications[notification].type == idle_worker}<i class="fa fa-desktop fa-fw"></i> IDLE Worker
                                    {else if $GLOBAL.userdata.lastnotifications[notification].type == success_login}<i class="fa fa-sign-in fa-fw"></i>Успешные входы в систему
                                    {/if}
                                    <span class="pull-right text-muted small">{$GLOBAL.userdata.lastnotifications[notification].time|relative_date}</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
{/section}

                        <li>
                            <a class="text-center" href="{$smarty.server.SCRIPT_NAME}?page=account&action=notifications">
                                <strong>Просмотреть все уведомления</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                {/if}
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> {if $GLOBAL.userdata.username|default}{$smarty.session.USERDATA.username|escape}{else}<span class="statuslang">Login</span>{/if} <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    	{if $smarty.session.AUTHENTICATED|default:"0" == 1}
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=dashboard"><i class="fa fa-dashboard fa-fw"></i><span class="dashlang"> Панель приборов</span></a>
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=account&action=edit"><i class="fa fa-gear fa-fw"></i><span class="setlang"> Настройки</span></a>
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=account&action=workers"><i class="fa fa-desktop fa-fw"></i><span class="worklang"> Фермы</span></a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=logout"><i class="fa fa-sign-out fa-fw"></i><span class="exitlang"> Выход</span></a>
                        </li>
                        {else}
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=login"><i class="fa fa-sign-in fa-fw"></i><span class="loginlang"> Вход</span></a>
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=register"><i class="fa fa-pencil fa-fw"></i><span class="reglang"> Регистрация</span></a>
                        </li>
                        {/if}
                    </ul>
                </li>
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				<i class="fa fa-cog fa-fw href="javascript:;"></i> <span class="lang">language</span> <i class="fa fa-caret-down"></i>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a class="english" id="english" href="javascript:;" onclick="testch(this.id)">
                                    English
                                </a>
                            </li>
                            <li>
                                <a class="russian" id="russian" href="javascript:;" onclick="testch(this.id)">
                                    Русский
                                </a>
                            </li>
                            <li>
                                <a class="ukrainian" id="ukrainian" href="javascript:;" onclick="testch(this.id)">
                                    Українська
                                </a>
                            </li>
                        </ul>
                    </li>
            </ul>
</nav>
