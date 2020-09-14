var clinic_select;
Ext.application({
    name : 'My App',
    launch : function() {

        // КОНТЕЙНЕР
        Ext.onReady(function(){
            Ext.create('Ext.panel.Panel', {
                renderTo: Ext.getBody(),
                width: 900,
                height: 600,
                padding:10,
                title: 'Мои клиенты',
                layout: {
                    type: 'hbox',
                    align: 'stretch'
                },
                items: [
                        {
                        xtype: 'panel',
                        width: 200,
                        items: [treeMenu]
                    },{
                        xtype: 'panel',
                        width: 700,
                        items: [gridClients, gridInfo, {
                            xtype: 'panel',
                            title: 'Важная информация',
                            html: '<div id="selTree"></div> <div id="selClient"></div> <div id="countData"></div> ',
                            width: 700,
                            height: 150
                        }]
                    },
                ]
            });
        });
        // END КОНТЕЙНЕР

        treeMenu = Ext.create('Ext.tree.Panel', {
            title: 'Клиентская база',
            rootVisible: true,
            split: true,
            region: 'west',
            collapsible: true,
            floatable: false,
            width: 200,
            height: 600,
            useArrows: true,
            renderTo: document.body,
            root: {
                text: 'Мои клиники',
                expanded: true,
                children: [
                    {
                        text: 'Стоматология',
                        expanded: true,
                        children: [
                            {
                                id: '1',
                                text: 'Фермо Мобайл',
                                leaf: true
                            },
                            {
                                id: '2',
                                text: 'Дентал Империя',
                                leaf: true
                            }
                        ]
                    },
                    {
                        text: 'Косметология',
                        expanded: true,
                        children: [
                            {
                                id: '3',
                                text: 'Diadem-Clinic',
                                leaf: true
                            },
                            {
                                id: '4',
                                text: 'ПРОФИТЛАЗЕР',
                                leaf: true
                            }
                        ]
                    }
                ]
            },
            listeners: {
                itemclick: {
                    fn: function(view, record, item, index, event) {
                        storeList.load({
                            url: '/api/users?clinic=' + record.data.id
                        });
                        clinic_select = record.data.id;
                        console.log(record.data.id);
                        console.log(record.data);
                        document.getElementById('selTree').innerHTML = 'Выбрана клиника ' + record.data.text;

                        document.getElementById('countData').innerHTML = '';
                        document.getElementById('selClient').innerHTML = '';
    
                        nodeId = record.data.id;
                        htmlId = item.id;
                    }
                }
            }
        });

        Ext.define('clientsList', {
           extend: 'Ext.data.Model',
           fields: ['clt_id', 'clt_name', 'clt_sname', 'clt_date', 'clt_email']
        });
        
        Ext.define('clientInfo', {
           extend: 'Ext.data.Model',
           fields: ['v_date', 'v_pay']
        });
    
        storeList = Ext.create('Ext.data.Store', {
            model: 'clientsList',
            proxy: {
                type: 'ajax',
                // url: '/api/users',
                reader: {
                    type: 'json',
                    // root: 'files'
                }
            }
        });

        storeInfo = Ext.create('Ext.data.Store', {
            model: 'clientInfo',
            proxy: {
                type: 'ajax',
                // url: '/api/users',
                reader: {
                    type: 'json',
                    // root: 'files'
                }
            }
        });
    
        gridClients = Ext.create('Ext.grid.Panel', {
            title: 'Список клиентов',
            // region: 'center',
            store: storeList,
            height: 200,
            renderTo: document.body,
            columns: [
                { header: '№ Клиента', width: 100, dataIndex: 'clt_id' },
                { header: 'Имя', width: 100, dataIndex: 'clt_name' },
                { header: 'Фамилия', width: 100, dataIndex: 'clt_sname' },
                { header: 'Дата рождения', width: 100, dataIndex: 'clt_date' },
                { header: 'Почта', width: 120, dataIndex: 'clt_email' },
            ],
            viewConfig: {
                stripeRows: true
            },
            listeners: {
                itemclick: {
                    fn: function(view, record, item, index, event) {
                        storeInfo.load({
                            url: '/api/user_info?cl=' + clinic_select + '&clt=' + record.data.clt_id
                        });
                        storeInfo.on('load', function() {
                            document.getElementById('countData').innerHTML = 'Клиент посетил клинику ' + storeInfo.getCount() + ' раз/раза';
                        });

                        document.getElementById('selClient').innerHTML = 'Выбран ' + record.data.clt_name;

                        nodeId = record.data.id;
                        htmlId = item.id;
                    }
                }
            }
        });
    
        gridInfo = Ext.create('Ext.grid.Panel', {
            title: 'Информация о записях клиента в выбранной клинике',
            region: 'center',
            store: storeInfo,
            height: 200,
            renderTo: document.body,
            columns: [
                { header: 'Дата записи', width: 100, dataIndex: 'v_date' },
                { header: 'Оплата', width: 100, dataIndex: 'v_pay' }
            ],
            viewConfig: {
                stripeRows: true
            }
        });
    }
});