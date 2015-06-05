object DataModuleScript: TDataModuleScript
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 356
  Width = 404
  object DelphiWebScript: TDelphiWebScript
    Left = 40
    Top = 16
  end
  object dwsDebugger: TdwsDebugger
    Left = 40
    Top = 160
  end
  object dwsRTTIConnector: TdwsRTTIConnector
    Script = DelphiWebScript
    StaticSymbols = False
    Left = 40
    Top = 112
  end
  object dwsGUIFunctions: TdwsGUIFunctions
    Left = 40
    Top = 208
  end
  object dwsComConnector: TdwsComConnector
    Script = DelphiWebScript
    StaticSymbols = True
    Left = 40
    Top = 64
  end
  object dwsUnitDelphiAST: TdwsUnit
    Script = DelphiWebScript
    Classes = <
      item
        Name = 'TSyntaxNode'
        Fields = <
          item
            Name = 'FParentNode'
            DataType = 'TSyntaxNode'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetType'
            ResultType = 'TSyntaxNodeType'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetTypeEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetCol'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetColEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetLine'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetLineEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetHasChildren'
            ResultType = 'Boolean'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasChildrenEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetHasAttributes'
            ResultType = 'Boolean'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasAttributesEval
            Kind = mkFunction
          end
          item
            Name = 'GetAttribute'
            Parameters = <
              item
                Name = 'Key'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsTSyntaxNodeMethodsGetAttributeEval
            Kind = mkFunction
          end
          item
            Name = 'HasAttribute'
            Parameters = <
              item
                Name = 'Key'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsTSyntaxNodeMethodsHasAttributeEval
            Kind = mkFunction
          end
          item
            Name = 'GetChildNodeCount'
            ResultType = 'Integer'
            OnEval = dwsTSyntaxNodeMethodsGetChildCountEval
            Kind = mkFunction
          end
          item
            Name = 'GetAttributeKeyCount'
            ResultType = 'Integer'
            OnEval = dwsTSyntaxNodeMethodsGetAttributeCountEval
            Kind = mkFunction
          end
          item
            Name = 'GetAttributeKey'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'String'
            OnEval = dwsTSyntaxNodeMethodsGetAttributeKeyEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetChildNode'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'TSyntaxNode'
            OnEval = dwsTSyntaxNodeMethodsGetChildNodeEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetParentNode'
            ResultType = 'TSyntaxNode'
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Col'
            DataType = 'Integer'
            ReadAccess = 'GetCol'
          end
          item
            Name = 'Line'
            DataType = 'Integer'
            ReadAccess = 'GetLine'
          end
          item
            Name = 'Type'
            DataType = 'TSyntaxNodeType'
            ReadAccess = 'GetType'
          end
          item
            Name = 'HasChildren'
            DataType = 'Boolean'
            ReadAccess = 'GetHasChildren'
          end
          item
            Name = 'HasAttributes'
            DataType = 'Boolean'
            ReadAccess = 'GetHasAttributes'
          end
          item
            Name = 'AttributeKeyCount'
            DataType = 'Integer'
            ReadAccess = 'GetAttributeKeyCount'
          end
          item
            Name = 'ChildNodeCount'
            DataType = 'Integer'
            ReadAccess = 'GetChildNodeCount'
          end
          item
            Name = 'AttributeKey'
            DataType = 'String'
            ReadAccess = 'GetAttributeKey'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'ChildNode'
            DataType = 'TSyntaxNode'
            ReadAccess = 'GetChildNode'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'ParentNode'
            DataType = 'TSyntaxNode'
            ReadAccess = 'GetParentNode'
          end>
      end
      item
        Name = 'TCompoundSyntaxNode'
        Methods = <
          item
            Name = 'GetEndCol'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndColEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetEndLine'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndLineEval
            Visibility = cvPrivate
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'EndCol'
            DataType = 'Integer'
            ReadAccess = 'GetEndCol'
          end
          item
            Name = 'EndLine'
            DataType = 'Integer'
            ReadAccess = 'GetEndLine'
          end>
      end>
    Enumerations = <
      item
        Name = 'TSyntaxNodeType'
        Elements = <
          item
            Name = 'ntUnknown'
          end
          item
            Name = 'ntAdd'
          end
          item
            Name = 'ntAddr'
          end
          item
            Name = 'ntAlignmentParam'
          end
          item
            Name = 'ntAnd'
          end
          item
            Name = 'ntAnonymousMethod'
          end
          item
            Name = 'ntArguments'
          end
          item
            Name = 'ntAs'
          end
          item
            Name = 'ntAssign'
          end
          item
            Name = 'ntAt'
          end
          item
            Name = 'ntAttribute'
          end
          item
            Name = 'ntAttributes'
          end
          item
            Name = 'ntBounds'
          end
          item
            Name = 'ntCall'
          end
          item
            Name = 'ntCase'
          end
          item
            Name = 'ntCaseElse'
          end
          item
            Name = 'ntCaseLabel'
          end
          item
            Name = 'ntCaseLabels'
          end
          item
            Name = 'ntCaseSelector'
          end
          item
            Name = 'ntConstant'
          end
          item
            Name = 'ntConstants'
          end
          item
            Name = 'ntContains'
          end
          item
            Name = 'ntDeref'
          end
          item
            Name = 'ntDimension'
          end
          item
            Name = 'ntDiv'
          end
          item
            Name = 'ntDot'
          end
          item
            Name = 'ntDownTo'
          end
          item
            Name = 'ntElement'
          end
          item
            Name = 'ntElse'
          end
          item
            Name = 'ntEmptyStatement'
          end
          item
            Name = 'ntEnum'
          end
          item
            Name = 'ntEqual'
          end
          item
            Name = 'ntExcept'
          end
          item
            Name = 'ntExceptionHandler'
          end
          item
            Name = 'ntExports'
          end
          item
            Name = 'ntExpression'
          end
          item
            Name = 'ntExpressions'
          end
          item
            Name = 'ntFDiv'
          end
          item
            Name = 'ntField'
          end
          item
            Name = 'ntFields'
          end
          item
            Name = 'ntFinalization'
          end
          item
            Name = 'ntFinally'
          end
          item
            Name = 'ntFor'
          end
          item
            Name = 'ntFrom'
          end
          item
            Name = 'ntGeneric'
          end
          item
            Name = 'ntGoto'
          end
          item
            Name = 'ntGreater'
          end
          item
            Name = 'ntGreaterEqual'
          end
          item
            Name = 'ntGuid'
          end
          item
            Name = 'ntIdentifier'
          end
          item
            Name = 'ntIf'
          end
          item
            Name = 'ntImplementation'
          end
          item
            Name = 'ntImplements'
          end
          item
            Name = 'ntIn'
          end
          item
            Name = 'ntIndexed'
          end
          item
            Name = 'ntInherited'
          end
          item
            Name = 'ntInitialization'
          end
          item
            Name = 'ntInterface'
          end
          item
            Name = 'ntIs'
          end
          item
            Name = 'ntLabel'
          end
          item
            Name = 'ntLHS'
          end
          item
            Name = 'ntLiteral'
          end
          item
            Name = 'ntLower'
          end
          item
            Name = 'ntLowerEqual'
          end
          item
            Name = 'ntMethod'
          end
          item
            Name = 'ntMod'
          end
          item
            Name = 'ntMul'
          end
          item
            Name = 'ntName'
          end
          item
            Name = 'ntNamedArgument'
          end
          item
            Name = 'ntNotEqual'
          end
          item
            Name = 'ntNot'
          end
          item
            Name = 'ntOr'
          end
          item
            Name = 'ntPackage'
          end
          item
            Name = 'ntParameter'
          end
          item
            Name = 'ntParameters'
          end
          item
            Name = 'ntPath'
          end
          item
            Name = 'ntPositionalArgument'
          end
          item
            Name = 'ntProtected'
          end
          item
            Name = 'ntPrivate'
          end
          item
            Name = 'ntProperty'
          end
          item
            Name = 'ntPublic'
          end
          item
            Name = 'ntPublished'
          end
          item
            Name = 'ntRaise'
          end
          item
            Name = 'ntRead'
          end
          item
            Name = 'ntRepeat'
          end
          item
            Name = 'ntRequires'
          end
          item
            Name = 'ntReturnType'
          end
          item
            Name = 'ntRHS'
          end
          item
            Name = 'ntRoundClose'
          end
          item
            Name = 'ntRoundOpen'
          end
          item
            Name = 'ntSet'
          end
          item
            Name = 'ntShl'
          end
          item
            Name = 'ntShr'
          end
          item
            Name = 'ntStatement'
          end
          item
            Name = 'ntStatements'
          end
          item
            Name = 'ntSub'
          end
          item
            Name = 'ntSubrange'
          end
          item
            Name = 'ntThen'
          end
          item
            Name = 'ntTo'
          end
          item
            Name = 'ntTry'
          end
          item
            Name = 'ntType'
          end
          item
            Name = 'ntTypeArgs'
          end
          item
            Name = 'ntTypeDecl'
          end
          item
            Name = 'ntTypeParams'
          end
          item
            Name = 'ntTypeSection'
          end
          item
            Name = 'ntValue'
          end
          item
            Name = 'ntVariable'
          end
          item
            Name = 'ntVariables'
          end
          item
            Name = 'ntXor'
          end
          item
            Name = 'ntUnaryMinus'
          end
          item
            Name = 'ntUnit'
          end
          item
            Name = 'ntUses'
          end
          item
            Name = 'ntWhile'
          end
          item
            Name = 'ntWith'
          end
          item
            Name = 'ntWrite'
          end>
      end>
    Functions = <
      item
        Name = 'ExportAbstractSyntaxTreeToXML'
        Parameters = <
          item
            Name = 'FileName'
            DataType = 'String'
          end>
        OnEval = dwsUnitDelphiASTFunctionsExportSyntaxTreeToXMLEval
      end
      item
        Name = 'GetAbstractSyntaxTree'
        Parameters = <
          item
            Name = 'InterfaceOnly'
            DataType = 'Boolean'
            HasDefaultValue = True
            DefaultValue = False
          end>
        ResultType = 'TSyntaxNode'
        OnEval = dwsUnitDelphiASTFunctionsGetAbstractSyntaxTreeEval
      end
      item
        Name = 'SyntaxNodeTypeToString'
        Parameters = <
          item
            Name = 'SyntaxNodeType'
            DataType = 'TSyntaxNodeType'
          end>
        ResultType = 'String'
        OnEval = dwsUnitDelphiASTFunctionsSyntaxNodeTypeToStringEval
      end
      item
        Name = 'SyntaxNodeTypeToName'
        Parameters = <
          item
            Name = 'SyntaxNodeType'
            DataType = 'TSyntaxNodeType'
          end>
        ResultType = 'String'
        OnEval = dwsUnitDelphiASTFunctionsSyntaxNodeTypeToNameEval
      end>
    UnitName = 'DelphiAST'
    StaticSymbols = False
    Left = 168
    Top = 64
  end
  object dwsUnitInternal: TdwsUnit
    Script = DelphiWebScript
    Functions = <
      item
        Name = 'WriteLn'
        Parameters = <
          item
            Name = 'Input'
            DataType = 'Variant'
          end>
        OnEval = dwsUnitInternalFunctionsWriteLnEval
      end>
    UnitName = 'EditorForm'
    StaticSymbols = False
    Left = 168
    Top = 16
  end
  object dwsUnitEditor: TdwsUnit
    Script = DelphiWebScript
    Classes = <
      item
        Name = 'IOTAEditor'
        Methods = <
          item
            Name = 'GetFileName'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetModified'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MarkModified'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'procedure Show;'
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'FileName'
            DataType = 'string'
            ReadAccess = 'GetFileName'
          end
          item
            Name = 'Modified'
            DataType = 'Boolean'
            ReadAccess = 'GetModified'
          end>
      end
      item
        Name = 'IOTAEditorContent'
        Methods = <
          item
            Name = 'GetContentAge'
            ResultType = 'TDateTime'
            Kind = mkFunction
          end>
      end
      item
        Name = 'IOTAEditReader'
      end
      item
        Name = 'IOTAEditWriter'
        Methods = <
          item
            Name = 'CopyTo'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'DeleteTo'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Insert'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Position'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetCurrentPos'
            ResultType = 'TOTACharPos'
            Visibility = cvPrivate
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'CurrentPos'
            DataType = 'TOTACharPos'
            ReadAccess = 'GetCurrentPos'
          end>
      end
      item
        Name = 'IOTAHighlighter'
        Methods = <
          item
            Name = 'GetIDString'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetName'
            ResultType = 'string'
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Name'
            DataType = 'string'
            ReadAccess = 'GetName'
          end
          item
            Name = 'IDString'
            DataType = 'string'
            ReadAccess = 'GetIDString'
          end>
      end
      item
        Name = 'IOTACustomEditView'
        Methods = <
          item
            Name = 'SameView'
            Parameters = <
              item
                Name = 'EditView'
                DataType = 'IOTACustomEditView'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end>
      end
      item
        Name = 'IOTAEditView40'
        Methods = <
          item
            Name = 'GetCursorPos'
            ResultType = 'TOTAEditPos'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetCursorPos'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TOTAEditPos'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetTopPos'
            ResultType = 'TOTAEditPos'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetTopPos'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TOTAEditPos'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetViewSize'
            ResultType = 'TSize'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'PosToCharPos'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'Integer'
              end>
            ResultType = 'TOTACharPos'
            Kind = mkFunction
          end
          item
            Name = 'CharPosToPos'
            Parameters = <
              item
                Name = 'CharPos'
                DataType = 'TOTACharPos'
              end>
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'ConvertPos'
            Parameters = <
              item
                Name = 'EdPosToCharPos'
                DataType = 'Boolean'
              end
              item
                Name = 'EditPos'
                DataType = 'TOTAEditPos'
                IsVarParam = True
              end
              item
                Name = 'CharPos'
                DataType = 'TOTACharPos'
                IsVarParam = True
              end>
            Kind = mkProcedure
          end
          item
            Name = 'GetAttributeAtPos'
            Parameters = <
              item
                Name = 'EdPos'
                DataType = 'TOTAEditPos'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'IncludeMargin'
                DataType = 'Boolean'
              end
              item
                Name = 'Element'
                DataType = 'Integer'
                IsVarParam = True
              end
              item
                Name = 'LineFlag'
                DataType = 'Integer'
                IsVarParam = True
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SameView'
            Parameters = <
              item
                Name = 'EditView'
                DataType = 'IOTAEditView'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'CursorPos'
            DataType = 'TOTAEditPos'
            ReadAccess = 'GetCursorPos'
            WriteAccess = 'SetCursorPos'
          end
          item
            Name = 'TopPos'
            DataType = 'TOTAEditPos'
            ReadAccess = 'GetTopPos'
            WriteAccess = 'SetTopPos'
          end
          item
            Name = 'ViewSize'
            DataType = 'TSize'
            ReadAccess = 'GetViewSize'
          end>
      end
      item
        Name = 'IOTASearchOptions'
        Methods = <
          item
            Name = 'GetCaseSensitive'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetDirection'
            ResultType = 'TSearchDirection'
            Kind = mkFunction
          end
          item
            Name = 'GetFromCursor'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetRegularExpression'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetSearchText'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetWholeFile'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetWordBoundary'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'SetCaseSensitive'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetDirection'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TSearchDirection'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetFromCursor'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetRegularExpression'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetSearchText'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetWholeFile'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetWordBoundary'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'CaseSensitive'
            DataType = 'Boolean'
            ReadAccess = 'GetCaseSensitive'
            WriteAccess = 'SetCaseSensitive'
          end
          item
            Name = 'Direction'
            DataType = 'TSearchDirection'
            ReadAccess = 'GetDirection'
            WriteAccess = 'SetDirection'
          end
          item
            Name = 'FromCursor'
            DataType = 'Boolean'
            ReadAccess = 'GetFromCursor'
            WriteAccess = 'SetFromCursor'
          end
          item
            Name = 'RegularExpression'
            DataType = 'Boolean'
            ReadAccess = 'GetRegularExpression'
            WriteAccess = 'SetRegularExpression'
          end
          item
            Name = 'SearchText'
            DataType = 'string'
            ReadAccess = 'GetSearchText'
            WriteAccess = 'SetSearchText'
          end
          item
            Name = 'WholeFile'
            DataType = 'Boolean'
            ReadAccess = 'GetWholeFile'
            WriteAccess = 'SetWholeFile'
          end
          item
            Name = 'WordBoundary'
            DataType = 'Boolean'
            ReadAccess = 'GetWordBoundary'
            WriteAccess = 'SetWordBoundary'
          end>
      end
      item
        Name = 'IOTAReplaceOptions'
        Methods = <
          item
            Name = 'GetPromptOnReplace'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetReplaceAll'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetReplaceText'
            ResultType = 'string'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetPromptOnReplace'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetReplaceAll'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetReplaceText'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'PromptOnReplace'
            DataType = 'Boolean'
            ReadAccess = 'GetPromptOnReplace'
            WriteAccess = 'SetPromptOnReplace'
          end
          item
            Name = 'ReplaceAll'
            DataType = 'Boolean'
            ReadAccess = 'GetReplaceAll'
            WriteAccess = 'SetReplaceAll'
          end
          item
            Name = 'ReplaceText'
            DataType = 'string'
            ReadAccess = 'GetReplaceText'
            WriteAccess = 'SetReplaceText'
          end>
      end
      item
        Name = 'IOTAEditPosition'
        Methods = <
          item
            Name = 'Align'
            Parameters = <
              item
                Name = 'Magnitude'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'BackspaceDelete'
            Parameters = <
              item
                Name = 'HowMany'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'HowMany'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'DistanceToTab'
            Parameters = <
              item
                Name = 'Direction'
                DataType = 'TSearchDirection'
              end>
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetCharacter'
            ResultType = 'String'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetColumn'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetIsSpecialCharacter'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetIsWhitespace'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetIsWordCharacter'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetLastRow'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetReplaceOptions'
            ResultType = 'IOTAReplaceOptions'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetRow'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetSearchErrorString'
            Parameters = <
              item
                Name = 'ErrorCode'
                DataType = 'Integer'
              end>
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetSearchOptions'
            ResultType = 'IOTASearchOptions'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GotoLine'
            Parameters = <
              item
                Name = 'LineNumber'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'InsertBlock'
            Parameters = <
              item
                Name = 'Block'
                DataType = 'IOTAEditBlock'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'InsertCharacter'
            Parameters = <
              item
                Name = 'Character'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'InsertFile'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'InsertText'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Move'
            Parameters = <
              item
                Name = 'Row'
                DataType = 'Integer'
              end
              item
                Name = 'Col'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveBOL'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveCursor'
            Parameters = <
              item
                Name = 'MoveMask'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveEOF'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveEOL'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveReal'
            Parameters = <
              item
                Name = 'Row'
                DataType = 'Integer'
              end
              item
                Name = 'Col'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveRelative'
            Parameters = <
              item
                Name = 'Row'
                DataType = 'Integer'
              end
              item
                Name = 'Col'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'procedure Paste;'
            Kind = mkProcedure
          end
          item
            Name = 'Read'
            Parameters = <
              item
                Name = 'NumberOfCharacters'
                DataType = 'Integer'
              end>
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'RepeatLastSearchOrReplace'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'Replace'
            Parameters = <
              item
                Name = 'Pattern'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'ReplaceText'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'CaseSensitive'
                DataType = 'Boolean'
              end
              item
                Name = 'RegularExpression'
                DataType = 'Boolean'
              end
              item
                Name = 'WholeFile'
                DataType = 'Boolean'
              end
              item
                Name = 'Direction'
                DataType = 'TSearchDirection'
              end
              item
                Name = 'ErrorCode'
                DataType = 'Integer'
                IsVarParam = True
              end>
            ResultType = 'Integer'
            Overloaded = True
            Kind = mkFunction
          end
          item
            Name = 'Replace'
            ResultType = 'Integer'
            Overloaded = True
            Kind = mkFunction
          end
          item
            Name = 'ReplaceAgain'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'procedure Restore;'
            Kind = mkProcedure
          end
          item
            Name = 'RipText'
            Parameters = <
              item
                Name = 'ValidChars'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'RipFlags'
                DataType = 'Integer'
              end>
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'procedure Save;'
            Kind = mkProcedure
          end
          item
            Name = 'Search'
            Parameters = <
              item
                Name = 'Pattern'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'CaseSensitive'
                DataType = 'Boolean'
              end
              item
                Name = 'RegularExpression'
                DataType = 'Boolean'
              end
              item
                Name = 'WholeFile'
                DataType = 'Boolean'
              end
              item
                Name = 'Direction'
                DataType = 'TSearchDirection'
              end
              item
                Name = 'ErrorCode'
                DataType = 'Integer'
                IsVarParam = True
              end>
            ResultType = 'Boolean'
            Overloaded = True
            Kind = mkFunction
          end
          item
            Name = 'Search'
            ResultType = 'Boolean'
            Overloaded = True
            Kind = mkFunction
          end
          item
            Name = 'SearchAgain'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'Tab'
            Parameters = <
              item
                Name = 'Magnitude'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Character'
            DataType = 'String'
            ReadAccess = 'GetCharacter'
          end
          item
            Name = 'Column'
            DataType = 'Integer'
            ReadAccess = 'GetColumn'
          end
          item
            Name = 'IsSpecialCharacter'
            DataType = 'Boolean'
            ReadAccess = 'GetIsSpecialCharacter'
          end
          item
            Name = 'IsWhiteSpace'
            DataType = 'Boolean'
            ReadAccess = 'GetIsWhiteSpace'
          end
          item
            Name = 'IsWordCharacter'
            DataType = 'Boolean'
            ReadAccess = 'GetIsWordCharacter'
          end
          item
            Name = 'LastRow'
            DataType = 'Integer'
            ReadAccess = 'GetLastRow'
          end
          item
            Name = 'ReplaceOptions'
            DataType = 'IOTAReplaceOptions'
            ReadAccess = 'GetReplaceOptions'
          end
          item
            Name = 'Row'
            DataType = 'Integer'
            ReadAccess = 'GetRow'
          end
          item
            Name = 'SearchOptions'
            DataType = 'IOTASearchOptions'
            ReadAccess = 'GetSearchOptions'
          end>
      end
      item
        Name = 'IOTASyncEditPoint100'
      end
      item
        Name = 'IOTASyncEditPoint'
      end
      item
        Name = 'IOTASyncEditPoints'
      end
      item
        Name = 'IOTAEditBlock90'
      end
      item
        Name = 'IOTAEditBlock'
      end
      item
        Name = 'INTAEditWindow'
      end
      item
        Name = 'IOTAEditView140'
        Ancestor = 'IOTAEditView40'
      end
      item
        Name = 'IOTAEditView145'
        Ancestor = 'IOTAEditView140'
      end
      item
        Name = 'IOTAEditView'
        Ancestor = 'IOTAEditView145'
      end
      item
        Name = 'IOTASourceEditor70'
        Ancestor = 'IOTAEditor'
      end
      item
        Name = 'IOTASourceEditor'
        Ancestor = 'IOTASourceEditor70'
      end
      item
        Name = 'IOTAEditLineTracker'
      end
      item
        Name = 'IOTAEditBuffer60'
        Ancestor = 'IOTASourceEditor'
      end
      item
        Name = 'IOTAEditBuffer'
        Ancestor = 'IOTAEditBuffer60'
      end
      item
        Name = 'IOTAEditBufferIterator'
      end
      item
        Name = 'IOTAKeyContext'
      end
      item
        Name = 'IOTAKeyboardServices'
      end
      item
        Name = 'IOTASpeedSetting'
        Methods = <
          item
            Name = 'GetDisplayName'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetName'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'ExecuteSetting'
            Parameters = <
              item
                Name = 'EditOptions'
                DataType = 'IOTAEditOptions'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'DisplayName'
            DataType = 'string'
            ReadAccess = 'GetDisplayName'
          end
          item
            Name = 'Name'
            DataType = 'string'
            ReadAccess = 'GetName'
          end>
      end
      item
        Name = 'IOTAEditOptions60'
        Methods = <
          item
            Name = 'AddSpeedSetting'
            Parameters = <
              item
                Name = 'SpeedSetting'
                DataType = 'IOTASpeedSetting'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'procedure BeginUpdate;'
            Kind = mkProcedure
          end
          item
            Name = 'procedure EndUpdate;'
            Kind = mkProcedure
          end
          item
            Name = 'GetBlockIndent'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetBufferOptions'
            ResultType = 'IOTABufferOptions'
            Kind = mkFunction
          end
          item
            Name = 'GetFontName'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetFontSize'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetForceCutCopyEnabled'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetSpeedSettingCount'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetSpeedSetting'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'IOTASpeedSetting'
            Kind = mkFunction
          end
          item
            Name = 'GetUseBriefCursorShapes'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetUseBriefRegularExpressions'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'RemoveSpeedSetting'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetBlockIndent'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetFontName'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetFontSize'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetForceCutCopyEnabled'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetSpeedSetting'
            Parameters = <
              item
                Name = 'Name'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetUseBriefCursorShapes'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetUseBriefRegularExpressions'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'BlockIndent'
            DataType = 'Integer'
            ReadAccess = 'GetBlockIndent'
            WriteAccess = 'SetBlockIndent'
          end
          item
            Name = 'BufferOptions'
            DataType = 'IOTABufferOptions'
            ReadAccess = 'GetBufferOptions'
          end
          item
            Name = 'FontName'
            DataType = 'string'
            ReadAccess = 'GetFontName'
            WriteAccess = 'SetFontName'
          end
          item
            Name = 'FontSize'
            DataType = 'Integer'
            ReadAccess = 'GetFontSize'
            WriteAccess = 'SetFontSize'
          end
          item
            Name = 'ForceCutCopyEnabled'
            DataType = 'Boolean'
            ReadAccess = 'GetForceCutCopyEnabled'
            WriteAccess = 'SetForceCutCopyEnabled'
          end
          item
            Name = 'SpeedSettingCount'
            DataType = 'Integer'
            ReadAccess = 'GetSpeedSettingCount'
          end
          item
            Name = 'SpeedSettings'
            DataType = 'IOTASpeedSetting'
            ReadAccess = 'GetSpeedSetting'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'UseBriefCursorShapes'
            DataType = 'Boolean'
            ReadAccess = 'GetUseBriefCursorShapes'
            WriteAccess = 'SetUseBriefCursorShapes'
          end
          item
            Name = 'UseBriefRegularExpressions'
            DataType = 'Boolean'
            ReadAccess = 'GetUseBriefRegularExpressions'
            WriteAccess = 'SetUseBriefRegularExpressions'
          end>
      end
      item
        Name = 'IOTAEditOptions'
        Ancestor = 'IOTAEditOptions60'
        Methods = <
          item
            Name = 'GetExtensions'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetOptionsName'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetOptionsIDString'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetSyntaxHighlighter'
            ResultType = 'IOTAHighlighter'
            Kind = mkFunction
          end
          item
            Name = 'GetOptionsIndex'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'SetExtensions'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetOptionsName'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetSyntaxHighlighter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'IOTAHighlighter'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Extensions'
            DataType = 'string'
            ReadAccess = 'GetExtensions'
            WriteAccess = 'SetExtensions'
          end
          item
            Name = 'OptionsName'
            DataType = 'string'
            ReadAccess = 'GetOptionsName'
            WriteAccess = 'SetOptionsName'
          end
          item
            Name = 'IDString'
            DataType = 'string'
            ReadAccess = 'GetOptionsIDString'
          end
          item
            Name = 'SyntaxHighlighter'
            DataType = 'IOTAHighlighter'
            ReadAccess = 'GetSyntaxHighlighter'
            WriteAccess = 'SetSyntaxHighlighter'
          end
          item
            Name = 'OptionsIndex'
            DataType = 'Integer'
            ReadAccess = 'GetOptionsIndex'
          end>
      end
      item
        Name = 'IOTAEditorServices60'
        IsStatic = True
        Methods = <
          item
            Name = 'GetEditOptions'
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices60MethodsGetEditOptionsEval
            Kind = mkFunction
          end
          item
            Name = 'GetKeyboardServices'
            ResultType = 'IOTAKeyboardServices'
            OnEval = dwsUnitEditorClassesIOTAEditorServices60MethodsGetKeyboardServicesEval
            Kind = mkFunction
          end
          item
            Name = 'GetTopBuffer'
            ResultType = 'IOTAEditBuffer'
            OnEval = dwsUnitEditorClassesIOTAEditorServices60MethodsGetTopBufferEval
            Kind = mkFunction
          end
          item
            Name = 'GetTopView'
            ResultType = 'IOTAEditView'
            OnEval = dwsUnitEditorClassesIOTAEditorServices60MethodsGetTopViewEval
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'EditOptions'
            DataType = 'IOTAEditOptions'
            ReadAccess = 'GetEditOptions'
          end
          item
            Name = 'KeyboardServices'
            DataType = 'IOTAKeyboardServices'
            ReadAccess = 'GetKeyboardServices'
          end
          item
            Name = 'TopBuffer'
            DataType = 'IOTAEditBuffer'
            ReadAccess = 'GetTopBuffer'
          end
          item
            Name = 'TopView'
            DataType = 'IOTAEditView'
            ReadAccess = 'GetTopView'
          end>
      end
      item
        Name = 'IOTAEditorServices70'
        Ancestor = 'IOTAEditorServices60'
        IsStatic = True
        Methods = <
          item
            Name = 'GetEditOptionsCount'
            ResultType = 'Integer'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsCountEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetEditOptionsIndex'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsIndexEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetEditOptions'
            Parameters = <
              item
                Name = 'IDString'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsEval
            Kind = mkFunction
          end
          item
            Name = 'GetEditOptionsForFile'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsForFileEval
            Kind = mkFunction
          end
          item
            Name = 'AddEditOptions'
            Parameters = <
              item
                Name = 'IDString'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsAddEditOptionsEval
            Kind = mkFunction
          end
          item
            Name = 'DeleteEditOptions'
            Parameters = <
              item
                Name = 'IDString'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsDeleteEditOptionsEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'EditOptionsCount'
            DataType = 'Integer'
            ReadAccess = 'GetEditOptionsCount'
          end
          item
            Name = 'EditorOptions'
            DataType = 'IOTAEditOptions'
            ReadAccess = 'GetEditOptionsIndex'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end>
      end
      item
        Name = 'IOTAEditorServices80'
        Ancestor = 'IOTAEditorServices70'
        IsStatic = True
      end
      item
        Name = 'IOTAEditorServices'
        Ancestor = 'IOTAEditorServices80'
        IsStatic = True
        Methods = <
          item
            Name = 'GetEditOptionsIDString'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'String'
            OnEval = dwsUnitEditorClassesIOTAEditorServicesMethodsGetEditOptionsIDStringEval
            Kind = mkFunction
          end>
      end
      item
        Name = 'INTAEditorServices'
        Methods = <
          item
            Name = 'GetEditWindowCount'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetEditWindow'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'INTAEditWindow'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetTopEditWindow'
            ResultType = 'INTAEditWindow'
            Visibility = cvPrivate
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'EditWindowCount'
            DataType = 'Integer'
            ReadAccess = 'GetEditWindowCount'
          end
          item
            Name = 'EditWindow'
            DataType = 'INTAEditWindow'
            ReadAccess = 'GetEditWindow'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'TopEditWindow'
            DataType = 'INTAEditWindow'
            ReadAccess = 'GetTopEditWindow'
          end>
      end
      item
        Name = 'INTACustomEditorView'
      end
      item
        Name = 'INTACustomEditorView150'
        Ancestor = 'INTACustomEditorView'
      end
      item
        Name = 'INTACustomEditorViewState'
      end
      item
        Name = 'INTACustomEditorViewStatusPanel'
      end
      item
        Name = 'INTACustomEditorSubView'
      end
      item
        Name = 'IOTAEditorViewServices140'
      end
      item
        Name = 'IOTAEditorViewServices'
        Ancestor = 'IOTAEditorViewServices140'
      end
      item
        Name = 'INTAEditorViewServices'
      end
      item
        Name = 'IOTABufferOptions60'
        Methods = <
          item
            Name = 'GetAutoIndent'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetBackspaceUnindents'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetCreateBackupFile'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetCursorThroughTabs'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetInsertMode'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetGroupUndo'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetKeepTrailingBlanks'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetLeftGutterWidth'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetRightMargin'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetOverwriteBlocks'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetPersistentBlocks'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetPreserveLineEnds'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetSmartTab'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetSyntaxHighlight'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetTabStops'
            ResultType = 'string'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetUndoAfterSave'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetUndoLimit'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetUseTabCharacter'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetAutoIndent'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetBackspaceUnindents'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetCreateBackupFile'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetCursorThroughTabs'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetInsertMode'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetGroupUndo'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetKeepTrailingBlanks'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetLeftGutterWidth'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetRightMargin'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetOverwriteBlocks'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetPersistentBlocks'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetPreserveLineEnds'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetSmartTab'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetSyntaxHighlight'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetTabStops'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetUndoAfterSave'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetUndoLimit'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetUseTabCharacter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'AutoIndent'
            DataType = 'Boolean'
            ReadAccess = 'GetAutoIndent'
            WriteAccess = 'SetAutoIndent'
          end
          item
            Name = 'BackspaceUnindents'
            DataType = 'Boolean'
            ReadAccess = 'GetBackspaceUnindents'
            WriteAccess = 'SetBackspaceUnindents'
          end
          item
            Name = 'CreateBackupFile'
            DataType = 'Boolean'
            ReadAccess = 'GetCreateBackupFile'
            WriteAccess = 'SetCreateBackupFile'
          end
          item
            Name = 'CursorThroughTabs'
            DataType = 'Boolean'
            ReadAccess = 'GetCursorThroughTabs'
            WriteAccess = 'SetCursorThroughTabs'
          end
          item
            Name = 'InsertMode'
            DataType = 'Boolean'
            ReadAccess = 'GetInsertMode'
            WriteAccess = 'SetInsertMode'
          end
          item
            Name = 'GroupUndo'
            DataType = 'Boolean'
            ReadAccess = 'GetGroupUndo'
            WriteAccess = 'SetGroupUndo'
          end
          item
            Name = 'KeepTrailingBlanks'
            DataType = 'Boolean'
            ReadAccess = 'GetKeepTrailingBlanks'
            WriteAccess = 'SetKeepTrailingBlanks'
          end
          item
            Name = 'LeftGutterWidth'
            DataType = 'Integer'
            ReadAccess = 'GetLeftGutterWidth'
            WriteAccess = 'SetLeftGutterWidth'
          end
          item
            Name = 'RightMargin'
            DataType = 'Integer'
            ReadAccess = 'GetRightMargin'
            WriteAccess = 'SetRightMargin'
          end
          item
            Name = 'OverwriteBlocks'
            DataType = 'Boolean'
            ReadAccess = 'GetOverwriteBlocks'
            WriteAccess = 'SetOverwriteBlocks'
          end
          item
            Name = 'PersistentBlocks'
            DataType = 'Boolean'
            ReadAccess = 'GetPersistentBlocks'
            WriteAccess = 'SetPersistentBlocks'
          end
          item
            Name = 'PreserveLineEnds'
            DataType = 'Boolean'
            ReadAccess = 'GetPreserveLineEnds'
            WriteAccess = 'SetPreserveLineEnds'
          end
          item
            Name = 'SmartTab'
            DataType = 'Boolean'
            ReadAccess = 'GetSmartTab'
            WriteAccess = 'SetSmartTab'
          end
          item
            Name = 'SyntaxHighlight'
            DataType = 'Boolean'
            ReadAccess = 'GetSyntaxHighlight'
            WriteAccess = 'SetSyntaxHighlight'
          end
          item
            Name = 'TabStops'
            DataType = 'string'
            ReadAccess = 'GetTabStops'
            WriteAccess = 'SetTabStops'
          end
          item
            Name = 'UndoAfterSave'
            DataType = 'Boolean'
            ReadAccess = 'GetUndoAfterSave'
            WriteAccess = 'SetUndoAfterSave'
          end
          item
            Name = 'UndoLimit'
            DataType = 'Integer'
            ReadAccess = 'GetUndoLimit'
            WriteAccess = 'SetUndoLimit'
          end
          item
            Name = 'UseTabCharacter'
            DataType = 'Boolean'
            ReadAccess = 'GetuseTabCharacter'
            WriteAccess = 'SetUseTabCharacter'
          end>
      end
      item
        Name = 'IOTABufferOptions70'
        Ancestor = 'IOTABufferOptions60'
        Methods = <
          item
            Name = 'GetShowSpace'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetShowTab'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'SetShowSpace'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetShowTab'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'ShowSpace'
            DataType = 'Boolean'
            ReadAccess = 'GetShowSpace'
            WriteAccess = 'SetShowSpace'
          end
          item
            Name = 'ShowTab'
            DataType = 'Boolean'
            ReadAccess = 'GetShowTab'
            WriteAccess = 'SetShowTab'
          end>
      end
      item
        Name = 'IOTABufferOptions'
        Ancestor = 'IOTABufferOptions70'
        Methods = <
          item
            Name = 'GetHighlightCurrentLine'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetShowLineBreaks'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetHighlightCurrentLine'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetShowLineBreaks'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'HighlightCurrentLine'
            DataType = 'Boolean'
            ReadAccess = 'GetHighlightCurrentLine'
            WriteAccess = 'SetHighlightCurrentLine'
          end
          item
            Name = 'ShowLineBreaks'
            DataType = 'Boolean'
            ReadAccess = 'GetShowLineBreaks'
            WriteAccess = 'SetShowLineBreaks'
          end>
      end>
    Constants = <
      item
        Name = 'mmSkipWord'
        DataType = 'Integer'
        Value = '0'
      end
      item
        Name = 'mmSkipNonWord'
        DataType = 'Integer'
        Value = '1'
      end
      item
        Name = 'mmSkipWhite'
        DataType = 'Integer'
        Value = '3'
      end
      item
        Name = 'mmSkipSpecial'
        DataType = 'Integer'
        Value = '4'
      end
      item
        Name = 'mmSkipNonSpecial'
        DataType = 'Integer'
        Value = '5'
      end
      item
        Name = 'mmSkipLeft'
        DataType = 'Integer'
        Value = '0'
      end
      item
        Name = 'mmSkipRight'
        DataType = 'Integer'
        Value = 16
      end
      item
        Name = 'mmSkipStream'
        DataType = 'Integer'
        Value = 32
      end>
    Enumerations = <
      item
        Name = 'TSearchDirection'
        Elements = <
          item
            Name = 'sdForward'
          end
          item
            Name = 'sdBackward'
          end>
      end
      item
        Name = 'TOTASyncMode'
        Elements = <
          item
            Name = 'smNone'
          end
          item
            Name = 'smNormal'
          end
          item
            Name = 'smTemplates'
          end>
      end>
    Forwards = <
      item
        Name = 'IOTAEditView'
      end
      item
        Name = 'IOTAEditBuffer'
      end
      item
        Name = 'IOTAEditOptions'
      end
      item
        Name = 'IOTAEditorServices'
      end
      item
        Name = 'IOTAKeyboardServices'
      end
      item
        Name = 'IOTAKeyContext'
      end
      item
        Name = 'IOTAEditBlock'
      end>
    Functions = <
      item
        Name = 'SetCursorPosition'
        Parameters = <
          item
            Name = 'Line'
            DataType = 'Integer'
          end
          item
            Name = 'Column'
            DataType = 'Integer'
          end>
        OnEval = dwsUnitSimpleEditorFunctionsSetCursorPositionEval
      end
      item
        Name = 'LocateText'
        Parameters = <
          item
            Name = 'Text'
            DataType = 'string'
          end>
        ResultType = 'Boolean'
        OnEval = dwsUnitSimpleEditorFunctionsLocateTextEval
      end
      item
        Name = 'ReplaceAll'
        Parameters = <
          item
            Name = 'Pattern'
            DataType = 'string'
          end
          item
            Name = 'ReplaceText'
            DataType = 'string'
          end>
        ResultType = 'Boolean'
        OnEval = dwsUnitEditorFunctionsReplaceAllEval
      end
      item
        Name = 'CenterCursor'
        Parameters = <
          item
            Name = 'Line'
            DataType = 'Integer'
          end
          item
            Name = 'Column'
            DataType = 'Integer'
          end>
        OnEval = dwsUnitEditorFunctionsCenterCursorEval
      end
      item
        Name = 'PageDown'
        OnEval = dwsUnitEditorFunctionsPageDownEval
      end
      item
        Name = 'PageUp'
        OnEval = dwsUnitEditorFunctionsPageUpEval
      end
      item
        Name = 'GotoBookmark'
        Parameters = <
          item
            Name = 'BookmarkID'
            DataType = 'Integer'
          end>
        ResultType = 'Boolean'
        OnEval = dwsUnitEditorFunctionsGotoBookmarkEval
      end
      item
        Name = 'MoveCursor'
        Parameters = <
          item
            Name = 'MoveMask'
            DataType = 'TMoveCursorMasks'
          end>
        OnEval = dwsUnitEditorFunctionsMoveCursorEval
      end
      item
        Name = 'SelectCurrentWord'
        OnEval = dwsUnitEditorFunctionsSelectCurrentWordEval
      end
      item
        Name = 'MoveOneWordRight'
        OnEval = dwsUnitEditorFunctionsMoveOneWordRightEval
      end
      item
        Name = 'MoveOneWordLeft'
        OnEval = dwsUnitEditorFunctionsMoveOneWordLeftEval
      end
      item
        Name = 'InsertText'
        Parameters = <
          item
            Name = 'Text'
            DataType = 'string'
          end>
        OnEval = dwsUnitEditorFunctionsInsertTextEval
      end>
    Records = <
      item
        Name = 'TOTAEditPos'
        Members = <
          item
            Name = 'Col'
            DataType = 'Integer'
          end
          item
            Name = 'Line'
            DataType = 'Integer'
          end>
        Properties = <>
      end
      item
        Name = 'TOTACharPos'
        Members = <
          item
            Name = 'CharIndex'
            DataType = 'Integer'
          end
          item
            Name = 'Line'
            DataType = 'Integer'
          end>
        Properties = <>
      end
      item
        Name = 'TSize'
        Members = <
          item
            Name = 'X'
            DataType = 'Integer'
          end
          item
            Name = 'Y'
            DataType = 'Integer'
          end>
        Properties = <>
      end>
    Synonyms = <
      item
        Name = 'TDateTime'
        DataType = 'Float'
      end
      item
        Name = 'TMoveCursorMasks'
        DataType = 'Integer'
      end>
    UnitName = 'Editor'
    StaticSymbols = False
    Left = 168
    Top = 112
  end
  object dwsUnitHelp: TdwsUnit
    Script = DelphiWebScript
    Functions = <
      item
        Name = 'GetIOTAHelpServices'
        ResultType = 'Variant'
        OnEval = dwsUnitHelpFunctionsGetIOTAHelpServicesEval
      end>
    UnitName = 'HelpServices'
    StaticSymbols = False
    Left = 168
    Top = 160
  end
end
